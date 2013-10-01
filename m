Return-Path: <riku.voipio@linaro.org>
Received: from mail-qe0-f48.google.com (mail-qe0-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id B06B66CBFD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 07:30:35 +0000 (UTC)
Received: by mail-qe0-f48.google.com with SMTP id nd7so4613042qeb.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 00:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=OcTs/Lq6Spqadg2sb9dwANosEAieMakPPlk8NIaBhqY=;
	b=On6hFGvPIYx75yk+ZyCNIy3TJUAThPFpDXSC/iRya03RLjufNIS4uvnTKlodFnQ/PD
	eanY861fwMTim9AmjPokVgSKD+mV2Q0qa70der4lxLiLYA8KkiqdQ2czTVgJlwU4raox
	1U0AueYXWjfi7/kVjAg2LV6QGre5RRwURDArgKaqXPpMDhCGsZK/Mz9whubMlWWdUXOr
	hUrdWWZ1wIw9RjmH6p1xCQBlq8gGlT1rbeA8xPv290KPjlwHwTw+HEPSBuiLHn9GEAYb
	Hh6FFwdaXH+p34mnR2LB3GhdsgODRtMjfmFDMPyvLjvwB+ZiIOb5IYTL1oHV8XKrIELD
	eMPw==
X-Gm-Message-State: ALoCoQkp31jUdXtXpynYDsBUeWy2tyrK7RXSB4PHtUd+09xApIc2EuzIyxvUlZ/z7X4fgV/aOPwH
MIME-Version: 1.0
X-Received: by 10.224.51.131 with SMTP id d3mr38628035qag.0.1380612636924;
	Tue, 01 Oct 2013 00:30:36 -0700 (PDT)
Received: by 10.49.71.232 with HTTP; Tue, 1 Oct 2013 00:30:36 -0700 (PDT)
In-Reply-To: <20130930192643.GA22970@mail.zedat.fu-berlin.de>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-2-git-send-email-riku.voipio@linaro.org>
	<20130930192643.GA22970@mail.zedat.fu-berlin.de>
Date: Tue, 1 Oct 2013 10:30:36 +0300
Message-ID: <CAAqcGHn4D8fkPxrKhnkgOkEMF-GEPL6C8zoRbMqE0urAYOuqRg@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Cc: openembedded-devel@lists.openembedded.org,
	Patch Tracking <patches@linaro.org>
Subject: Re: [meta-java][PATCH 2/3] jamvm: update to latest in openjdk-7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2013 07:30:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On 30 September 2013 22:26, Henning Heinold <heinold@inf.fu-berlin.de> wrote:
> On Mon, Sep 30, 2013 at 04:46:10PM +0300, Riku Voipio wrote:
>> jamvm has wrong wrong checksums for version referred. Update
>> the version to match that is in jamvm_git.bb and make checksums
>> match.
>> ---
>>  recipes-core/openjdk/openjdk-7-release-25b30.inc | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-core/openjdk/openjdk-7-release-25b30.inc b/recipes-core/openjdk/openjdk-7-release-25b30.inc
>> index 363b6e2..60f4f43 100644
>> --- a/recipes-core/openjdk/openjdk-7-release-25b30.inc
>> +++ b/recipes-core/openjdk/openjdk-7-release-25b30.inc
>> @@ -43,11 +43,11 @@ CACAO_URI = "http://icedtea.classpath.org/download/drops/cacao/${CACAO_FILE};nam
>>  SRC_URI[cacao.md5sum] = "ec1def7f0d3d25e9e7da47c480f26a73"
>>  SRC_URI[cacao.sha256sum] = "d49f79debc131a5694cae6ab3ba2864e7f3249ee8d9dc09aae8afdd4dc6b09f9"
>>
>> -JAMVM_VERSION = "0972452d441544f7dd29c55d64f1ce3a5db90d82"
>> +JAMVM_VERSION = "ac22c9948434e528ece451642b4ebde40953ee7e"
>>  JAMVM_FILE = "jamvm-${JAMVM_VERSION}.tar.gz"
>>  JAMVM_URI = "http://icedtea.classpath.org/download/drops/jamvm/${JAMVM_FILE};name=jamvm;unpack=false"
>> -SRC_URI[jamvm.md5sum] = "740c2587502831cac6797d1233a7e27b"
>> -SRC_URI[jamvm.sha256sum] = "47fce7bd556c1b1d29a93b8c45497e0d872b48b7f535066b303336f29d0f0d8d"
>> +SRC_URI[jamvm.md5sum] = "3a67d0f3471bd2d5b2446d91bfa73f73"
>> +SRC_URI[jamvm.sha256sum] = "4662da1fe3e0e11d8fa685c7f2fc748576b9f3d3e37dc56b798dd6a5bd6b61e7"
>>
>>  # Allow overriding this separately
>>  OEPATCHES = "\
>> --
>> 1.8.1.2
>
> Hi,
>
> jamvm version is fine we use the one openjdk 2.3 expect for now, but I have to update the cacao one.
>
> So this patch will be dropped.

If you want to keep the current jamvm, you still need to fix the checksums:

wget http://icedtea.classpath.org/download/drops/jamvm/jamvm-0972452d441544f7dd29c55d64f1ce3a5db90d82.tar.gz

voipio@aimless:~/tmp$ md5sum
jamvm-0972452d441544f7dd29c55d64f1ce3a5db90d82.tar.gz
f4616713ec609e35aa8070811bd952aa
jamvm-0972452d441544f7dd29c55d64f1ce3a5db90d82.tar.gz
voipio@aimless:~/tmp$ sha256sum
jamvm-0972452d441544f7dd29c55d64f1ce3a5db90d82.tar.gz
bfa706402ac934d24f7119eb78f6be65e91439a4b2e49dbcc21e288137808f03
jamvm-0972452d441544f7dd29c55d64f1ce3a5db90d82.tar.gz

These do not match with the checksums in openjdk-7-release-25b30.inc

Riku

