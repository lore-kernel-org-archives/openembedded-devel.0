Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chrisfriedt@gmail.com>) id 1LVzP3-0007lU-TE
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Feb 2009 03:28:14 +0100
Received: by an-out-0708.google.com with SMTP id d40so879341and.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Feb 2009 18:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4JniPfj2ab9cS9gMXnkKJxHsSpLtTEUSXBa8LpydUrg=;
	b=bzdd5QCJZ1lVDM51sAFy8LB1GSolUF4AoufQe+ZbpAM7e7hUod5hXg9f7f6ZEdtqy8
	vF/fNPmkdW5ULww6wPFKLPsBMn9jLEjOMFDIcunJb+RYxWWlfJM+wqKsVAAY7cqpHcbC
	QGJ/tZ63r/OjV5ax/ighetKEMis+KGFRZCYKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oX54M6vojfkyOM2zjNqhJCiVUiXw4yBI7ULIdAkuhtVhViOEtq4FT6ewFov3tAGn7H
	sonPx+b4qaGJ8yuciqNEc1EBi1vHAjwoyiP37SWQmTVWkFICG3gWTzHkHMtPixKmWmKr
	eoMF7yblAiAIYjMw4Bzq0izUwkMwySSOCZpDw=
MIME-Version: 1.0
Received: by 10.100.57.13 with SMTP id f13mr1102613ana.143.1234060056117; Sat, 
	07 Feb 2009 18:27:36 -0800 (PST)
In-Reply-To: <gmkdv7$cbc$1@ger.gmane.org>
References: <3ea34a000902070825j48291819x61976d871da422d@mail.gmail.com>
	<gmkdv7$cbc$1@ger.gmane.org>
Date: Sat, 7 Feb 2009 21:27:36 -0500
Message-ID: <3ea34a000902071827x6e28e053m837c6334ca5939f@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: c compiler cannot create executables (do_configure, gettext-native-0.17-r3)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Feb 2009 02:28:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Koen

I determined what the problem was - ccache - I think that because
ccache existed on my (well, my work's) build machine, that it
consistently interfered with *-native.

The remote machine I'm building OE on is a CentOS 4.5 box (not my
preference, but the IT manager's), and my solution was to just remove
ccache entirely.

The relevant part of gettext-0.17/autoconf-lib-link/config.log is below.

Cheers,

Chris

=============================================

configure:2404: checking for x86_64-linux-gcc
configure:2431: result: ccache gcc
configure:2709: checking for C compiler version
configure:2716: ccache gcc --version >&5
configure:2719: $? = 1
configure:2726: ccache gcc -v >&5
configure:2729: $? = 1
configure:2736: ccache gcc -V >&5
configure:2739: $? = 1
configure:2762: checking for C compiler default output file name
configure:2789: ccache gcc
-isystem/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include
-O2 -isystem/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/include
-L/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath-link,/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib
-Wl,-rpath,/home/cfriedt/oe/build-cl9400/tmp/staging/x86_64-linux/usr/lib
-Wl,-O1 conftest.c  >&5
configure:2792: $? = 1
configure:2830: result:
configure: failed program was:
| /* confdefs.h.  */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "autoconf-lib-link"
| #define VERSION "0.17"
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }
configure:2837: error: C compiler cannot create executables
See `config.log' for more details.


On Sat, Feb 7, 2009 at 11:47 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 07-02-09 17:25, Christopher Friedt wrote:
>>
>> Hi everyone,
>>
>> I've run into a configure error that I'm not quite sure how to fix -
>> it could have something to do with ccache, and I've tried clearing out
>> my cache already, but that hasn't worked. It's for a 'new' machine,
>> but I've essentially just copied the aximx50.conf and renamed it to
>> cl9400.conf (also added the relevent parts according to
>> http://wiki.openembedded.net/index.php/Adding_a_new_Machine).
>>
>> What's really odd, is that I've gone into the specified build directly
>> directly after it apparently fails, taken the exact ./configure
>> command from config.log, and run it without any errors showing up.
>>
>> I would appreciate if anyone would like to offer some advice - please
>> see the build log below.
>
> check config.log in ${S} to see what the actual error is.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


