Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDuio-0005sE-N8
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 08:59:00 +0100
Received: by yxe42 with SMTP id 42so1178986yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 00:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZoYn6qq0yCwP8w3zjf5apTcR14KzIlVHlItdObe7vbY=;
	b=bLmZR71LGtw7vcqCTqejQzpoPN2V91PmdutKIfYXStVDeQROpN9pKk2r1BXUUtqblQ
	s9oY87AEb1jdFK1XI+xOcg3vBTcVaGI8CrpIo1ofGZRhWfOKWMYTdRgIdDWB1Q6ZXO/8
	aTnOokfv69gKqU16L2MrDjZd4rsFVptNFK/WE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r7m8X3Rq9wZljv9/5mSA0swwCRgKw909WG8RxYInvjufblOxGhjl2Svu2Typz+kqr3
	SHbHaaJ+GDWrCUawyBUdn2fP/YQUqc/s76PN0vOK+aa7G07WIVDutq7qgVUSmT2X7GN0
	Hbe2XDH77XzdU1CEN+gAmeS61OiISfPpjkAIg=
MIME-Version: 1.0
Received: by 10.42.157.199 with SMTP id e7mr118311icx.67.1288857486013; Thu,
	04 Nov 2010 00:58:06 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 00:58:05 -0700 (PDT)
In-Reply-To: <20101103235825.GD28852@denix.org>
References: <1288826934-8339-1-git-send-email-eric@eukrea.com>
	<4CD1F324.9090704@mentor.com> <20101103235825.GD28852@denix.org>
Date: Thu, 4 Nov 2010 08:58:05 +0100
Message-ID: <AANLkTinK7x-VdLUb1451euYD5u0OTfwoDjSEwa7fzE89@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] own-mirrors.bbclass: allow mirroring of scm fetched packages
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
X-List-Received-Date: Thu, 04 Nov 2010 07:59:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/4 Denys Dmytriyenko <denis@denix.org>:
> On Wed, Nov 03, 2010 at 04:41:24PM -0700, Tom Rini wrote:
>> Eric B??nard wrote:
>>> this way, it's possible to setup a local webserver (for example
>>> using busybox httpd -p "8081" -h backuped_download_dir) serving
>>> a presiously fetched download directory and to build wihout the
>>> need for an internet access
>>> this can also be used when connected to know to know which packages
>>> are missing from the local mirror's directory (and thus are fetched
>>> from internet as a fallback), it's possible to run the server this way =
:
>>> busybox httpd -p "8081" -h backuped_download_dir -vv -f | grep -B 1
>>> response:404
>>> to get the name of the missing packages.
>>> Signed-off-by: Eric B??nard <eric@eukrea.com>
>>
>> Acked-by: Tom Rini <tom_rini@mentor.com>
>
> Looks like a nice way to have local mirrored downloads. May I suggest to =
put
> the above examples of running busybox httpd as a comment inside the class=
.
>
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Cool. Thanks alot!
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>>
>>> ---
>>> =A0classes/own-mirrors.bbclass | =A0 =A07 ++++++-
>>> =A01 files changed, 6 insertions(+), 1 deletions(-)
>>> diff --git a/classes/own-mirrors.bbclass b/classes/own-mirrors.bbclass
>>> index e8a0f48..720ce42 100644
>>> --- a/classes/own-mirrors.bbclass
>>> +++ b/classes/own-mirrors.bbclass
>>> @@ -1,4 +1,9 @@
>>> =A0PREMIRRORS() {
>>> -https?://.*/.* ${SOURCE_MIRROR_URL}
>>> +cvs://.*/.* ${SOURCE_MIRROR_URL}
>>> +svn://.*/.* ${SOURCE_MIRROR_URL}
>>> +git://.*/.* ${SOURCE_MIRROR_URL}
>>> +hg://.*/.* ${SOURCE_MIRROR_URL}
>>> +bzr://.*/.* ${SOURCE_MIRROR_URL}
>>> +https?$://.*/.* ${SOURCE_MIRROR_URL}
>>> =A0ftp://.*/.* =A0${SOURCE_MIRROR_URL}
>>> =A0}
>>
>>
>> --
>> Tom Rini
>> Mentor Graphics Corporation
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


