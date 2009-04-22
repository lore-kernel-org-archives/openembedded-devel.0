Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwfH0-0006J6-Fn
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 18:26:10 +0200
Received: by yx-out-1718.google.com with SMTP id 36so31366yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 09:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=aWxcWdzUqc1o6mLN0QlpOqFUlJQhp76AFGryMpKTq/o=;
	b=aBgADvkknpTMZ8wwy4t79sqIi05HBDaf8/46HIWBv+GKOx8UwE5hSMqHMJFm+RMMr8
	kGiEkLPGeYcubA6okAlhZH59lQY9sF261w1Mska9rKDg6IwfqnccdY7R2EaoM737dVZS
	1W7APAS5PCaRaxJJ6+164JlA/HbUvYnvP1jCg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=MYvR9fUVetmzb71/7pN79zUD8hzoRI9PK/N6+jiowfHDhOCHQiI4NwVgDRXo/APzDL
	mDXfIbF88ejKk5qpfZXNqHMqgkp/YITEacc7uY8KoVTuLSckEjAguKWWKCxd9bIjUUll
	TSSg6vXF5i0G/TnzMQvOKBvWXyh72D8FTyf6U=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.141.10 with SMTP id o10mr11713351and.36.1240417298062; 
	Wed, 22 Apr 2009 09:21:38 -0700 (PDT)
In-Reply-To: <186800.19618.qm@web23308.mail.ird.yahoo.com>
References: <186800.19618.qm@web23308.mail.ird.yahoo.com>
Date: Wed, 22 Apr 2009 13:21:37 -0300
X-Google-Sender-Auth: 065b5e8221cfb8b5
Message-ID: <be7a9f3d0904220921o9bad1ecn8a3ee7bc27c2688@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: intltool dependence: libxml-parser-perl-native
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
X-List-Received-Date: Wed, 22 Apr 2009 16:26:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Caudiu,

On Wed, Apr 22, 2009 at 1:01 PM, Claudiu mdc <claudiu_fw85@yahoo.it> wrote:
> Hi,
> I had a problem when building my image in OE. The build process stopped on "intltool" with this error:
> checking for perl... /home/claudiu/oeDevel/tmpoe/staging/i686-linux/usr/bin/perl
> checking for XML::Parser... configure: error: XML::Parser perl module is required for intltoolFATAL: oe_runconf failed
> To solve this you just have to build "libxml-parser-perl-native" package, clean the previous intltool (bitbake intltool -c clean) and rebuild it.
>
> ("libxml-parser-perl-native" is a dependence for "intltool")

Yes, you're completely right; I did it here in our overlay but didn't
manage to prepare a patch to send with that.

Are you willing to provide a patch for that? If yes, you can do that
and I push it for you.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


