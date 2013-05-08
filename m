Received: from mail-ob0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ua8r0-0005dQ-H7
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 20:12:42 +0200
Received: by mail-ob0-f173.google.com with SMTP id 6so2032616oba.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2013 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=r5PDQBGIDGenMkD77iDPMQEmhoCE7tCeWbTQU4Tdf7w=;
	b=HwkX2DCSsrC+sJNkWhXKuvJoVld0e1BIvHsuWBoxhZBJmEuEIzlEeWFYDxA2lZM7iO
	7CCZFs59k4G31bDs5RmRbF9ii63/Cgm7vrde4RKQBr8osRfpZXwp+NM12H8seGY70iUB
	hBrwU8+pG5qTM2AjXIEqC2vRXfj1RjTX0FYDddqunakWTYdl944JVQmGwjSqmZNN8YQa
	LblqPho8fAx3autVw8V/5OTWCf+Ce5zmmK1/9cM4xGmIBRj4dzoVHU+PsvgOouP4pBPw
	OnWF4KxjBMXZtYu6j427v6q0gYtldZLeiSGFC2qETJcR0PxzFR838SQNpGWWh0wSQswo
	q0xQ==
MIME-Version: 1.0
X-Received: by 10.60.116.3 with SMTP id js3mr517547oeb.142.1368035674999; Wed,
	08 May 2013 10:54:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Wed, 8 May 2013 10:54:34 -0700 (PDT)
In-Reply-To: <20130508174906.GC9137@windriver.com>
References: <1368034148-3512-1-git-send-email-otavio@ossystems.com.br>
	<20130508174906.GC9137@windriver.com>
Date: Wed, 8 May 2013 14:54:34 -0300
X-Google-Sender-Auth: GTrCVYSdnUaTdLhQPYcQWhY4Qus
Message-ID: <CAP9ODKrxBvfMMMVP95PsGE+O2zBRmu9SwmYZUr_Bp=ODJJFTSg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Joe MacDonald <Joe.MacDonald@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommendation to CIFS kernel module
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
X-List-Received-Date: Wed, 08 May 2013 18:12:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 8, 2013 at 2:49 PM, Joe MacDonald
<Joe.MacDonald@windriver.com> wrote:
> [[oe] [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommendation to CIFS kernel module] On 13.05.08 (Wed 14:29) Otavio Salvador wrote:
>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> Note: This patch has been tested in master and danny. Please
>>       consider it for master, dylan and danny branches.
>>
>>  meta-networking/recipes-support/cifs/cifs-utils_git.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
>> index 19b60ad..de2786a 100644
>> --- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
>> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
>> @@ -5,6 +5,7 @@ LICENSE = "GPLv3 & LGPLv3"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>>  PV = "5.9"
>> +PR = "r1"
>
> For the sake of one patch in all branches, I think we're okay, but in
> master we don't actually need PR anymore, do we?

In master it is not required (but still accepted) however to keep the
upgrade path from danny -> dylan -> dylan+1 we need.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


