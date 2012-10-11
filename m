Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TMOjV-0007Ic-UQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Oct 2012 21:47:50 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so1860036pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2012 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Tti2OK1CTwF1AK16wlLBP4q9KNjlsyvV1W/EQlE5A0k=;
	b=EENkVYZxrvMRpLQ0J7BAIN4V2EBkQxxJ1Ijn8vbI3Ux0IRgLor/L24loWchrwODWiy
	brsmNYszs4f/Qgt4JdpzCtlmG4TIggm+gTIqcaOSB9bvbPOWcUhXTfTCWlUyYShUlnXd
	zI+bZNkxsYRmLmxraty9t/vm+pkEcUzFz4Lcfm+Wgjm+4qKTzSxOK504lxeHomFmGSOh
	NzRaOQZ/v3F9MLcfiNTEXAfr5isflwBOpHwmFCi4s+M9KRpTJOh3JApIp8QWb6Jm3rxA
	zvkq75D2R+TCeHksg8GxFVqnDslCIBFYYXRGDiBGqS+1kbctZ4POMrzcNiZMQQc9YmX4
	8+7w==
MIME-Version: 1.0
Received: by 10.66.75.74 with SMTP id a10mr4880687paw.46.1349984075736; Thu,
	11 Oct 2012 12:34:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Thu, 11 Oct 2012 12:34:35 -0700 (PDT)
In-Reply-To: <20121011090133.GA3589@jama.jama.net>
References: <20121010104253.EB7AB1034A@opal>
	<20121011090133.GA3589@jama.jama.net>
Date: Thu, 11 Oct 2012 16:34:35 -0300
X-Google-Sender-Auth: ixTpfj7C_Am94Q5Fa496_OVBna4
Message-ID: <CAP9ODKrwSMJNs2T3dW4yQ=QWD9upTm=L+M+AX9jHY=xivPAeTw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Otavio Salvador : libav: Change the PACKAGES_DYNAMIC expression to be more restrict
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
X-List-Received-Date: Thu, 11 Oct 2012 19:47:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 6:01 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Oct 10, 2012 at 10:42:52AM +0000, git@git.openembedded.org wrote:
>> Module: meta-openembedded.git
>> Branch: master
>> Commit: 97350f52280ea9b2f3d7b36ef248be5ba3e7c696
>> URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=97350f52280ea9b2f3d7b36ef248be5ba3e7c696
>>
>> Author: Otavio Salvador <otavio@ossystems.com.br>
>> Date:   Sat Oct  6 20:18:30 2012 +0000
>>
>> libav: Change the PACKAGES_DYNAMIC expression to be more restrict
>>
>> Using 'lib*' we end having problem with every other package that
>> generate libraries dynamically thus we changed it to match the library
>> prefixes.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>
>> ---
>>
>>  meta-oe/recipes-multimedia/libav/libav.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
>> index aa170c5..4a1716f 100644
>> --- a/meta-oe/recipes-multimedia/libav/libav.inc
>> +++ b/meta-oe/recipes-multimedia/libav/libav.inc
>> @@ -119,4 +119,4 @@ python populate_packages_prepend() {
>>                        allow_links=True)
>>  }
>>
>> -PACKAGES_DYNAMIC = "lib*"
>> +PACKAGES_DYNAMIC = "lib(av(codec|device|filter|format|util)|postproc)*"
>
> Unfortunatelly this does not work, this regexp matches everything starting with 'lib',
> so it's only a bit more strict then old version which matched everything starting with 'li' :).
>
> Please change it to:
> PACKAGES_DYNAMIC = "^lib(av(codec|device|filter|format|util)|postproc)"
> or
> PACKAGES_DYNAMIC = "^lib(av(codec|device|filter|format|util)|postproc).*"
>
> ^ isn't used in any PACKAGES_DYNAMIC in oe-core, but it could make matching faster
> * is used wrong in all PACKAGES_DYNAMIC in oe-core (as in glob, but not regexp), so all those last '-' are optional

PACKAGES_DYNAMIC =
"^lib(av(codec|device|filter|format|util)|postproc).*" is the right
one.

Koen, I am traveling but people amend my patch commit it please ... or
I send a new revision next week.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


