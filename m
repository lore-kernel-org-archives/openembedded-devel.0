Received: from mail-yw0-f193.google.com ([209.85.211.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <spyzer.abhishek0@gmail.com>) id 1O9yo3-0002qS-A4
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:59:53 +0200
Received: by ywh31 with SMTP id 31so2418215ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 03:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=2TDGfe1kv906jYJggVEBiFww/K/C95nFEjQdF6nUR/0=;
	b=hMSPMS7lFFptdK4qCf3jlxx07XOdPVaShYrYw0i/zRXAmgksRBf0YiTVzRWDvKXyKt
	9IINRvHGC/V1bHLKmR7IRm3/P4GCA+y6zmVnuXqVleL5zKVYqnDtpKThUUVQmNExMNnb
	YrNNCKSj0f+WmsQR9M5HrQ0XaMxeWLYndP0oM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ivfaGu8H0uo3bnSqEy8lw7+XdI41DoG5g/pRhHI/g6jVR4t42TJoPVNwcut8etpunX
	5FnMY0Aao1qfnZ7sJq43AvoKvqYUaFaIRwIi+Fkz1gOtQNUl867I/+WaKq5uwkvDWcFB
	HYrF45G2stcZNeYCnCeL/GI7XQ6OBNfNLkxWg=
Received: by 10.150.127.11 with SMTP id z11mr1278535ybc.20.1273143362190; Thu, 
	06 May 2010 03:56:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.124.11 with HTTP; Thu, 6 May 2010 03:55:42 -0700 (PDT)
In-Reply-To: <4BE29322.7060205@eukrea.com>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com> 
	<hr3im2$gf6$1@dough.gmane.org>
	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>
	<hr4t3j$tds$1@dough.gmane.org>
	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>
	<4BD84B08.4000300@eukrea.com>
	<g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>
	<4BDFC996.5060606@eukrea.com>
	<AANLkTik56w90iywd5ZmzV_geM0ULabHWVCuJIfxzHY7u@mail.gmail.com> 
	<4BE29322.7060205@eukrea.com>
From: Abhishek Sharma <spyzer.abhishek0@gmail.com>
Date: Thu, 6 May 2010 16:25:42 +0530
Message-ID: <AANLkTimCrYrjKuREPyUgYQwxlWdAN_OjF5ECiRBLj6Pp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.193
X-SA-Exim-Mail-From: spyzer.abhishek0@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Thu, 06 May 2010 10:59:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2010 at 3:30 PM, Eric B=E9nard <eric@eukrea.com> wrote:

> Le 06/05/2010 11:53, Abhishek Sharma a =E9crit :
>
>  Thanks for the solution Eric. I was also facing problems regarding tslib=
,
>> which u answered on the irc. I did
>> IMAGE_INSTALL +=3D "qt4-embedded-plugin-mousedriver-tslib"
>>
>> but still when I am running the qtehelloworld app on the created image i=
n
>> qemu, everything is being "displayed" fine but the mouse pointer is not
>> moving when I try it to, in other words the touch screen ain't working
>> with
>> the image while it works when i try to run a preconfigured opie-image.
>>
>
> QWS_MOUSE_PROTO=3Dtslib:/dev/input/touchscreen0 qt-app -qws
>
> you will find details here :
> http://doc.qt.nokia.com/4.6/qt-embedded-envvars.html
>
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

About the /dev node, there is no such device as /dev/input/touchscreen0, is
it because i am only doing a base-image kind of install???
i set the environment variable which was specified, but no progress.

--=20
Abhishek Sharma

