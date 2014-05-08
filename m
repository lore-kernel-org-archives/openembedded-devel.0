Return-Path: <gizero@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 36BE0605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2014 05:15:55 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id ib6so2584606vcb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 22:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=n8yRPxTLA0G2VH90u9la/FHq/lBXJm/KYxBRnK4VIv0=;
	b=mbFSQGTHjwdMbBV8170UfZ1giTllUnN6p6VK7HNKzQk5KMCySK4N8m9X9DbVT5f6Yi
	+IPXR3hzj4JGIePplh5bXS7QITF/ELbuFqRXKD7w3mUmA5MnBl0yi3ujG4joDirvxh+a
	VgIZac25gMHyKulXpZS5orn8Rqi0WCr4jfOXzmIuK1T5xhPDEOkU3m4jN0MnAkHuZoOj
	Hb9QtkCJu/5+Vy5N5k2bX8owG+Qv5CiFpzsx3hbG/6jUYRHW8bPNec2DcvtxPwe4T733
	27sJ+ynPkTOD5zfj1qs2h8q0yXHzVrwzzsohgwuUN2mfANeci5OwCRLrEhis14ehH1oa
	VD9A==
MIME-Version: 1.0
X-Received: by 10.58.186.71 with SMTP id fi7mr1293001vec.32.1399526156283;
	Wed, 07 May 2014 22:15:56 -0700 (PDT)
Received: by 10.220.0.67 with HTTP; Wed, 7 May 2014 22:15:56 -0700 (PDT)
In-Reply-To: <20140507170904.GK30955@jama>
References: <1399357964-15638-1-git-send-email-gizero@gmail.com>
	<20140507170904.GK30955@jama>
Date: Thu, 8 May 2014 07:15:56 +0200
Message-ID: <CAC+thW2mbKj250h9saYKHgcYOh1kiU6Mb5j5HddpCa8HVMFg3Q@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libconfig: inherit from autotools-brokensep
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
X-List-Received-Date: Thu, 08 May 2014 05:15:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On Wed, May 7, 2014 at 7:09 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, May 06, 2014 at 08:32:44AM +0200, Andrea Galbusera wrote:
>> do_compile fails otherwise
>
> This looks exactly the same as the patch you sent 2 days before. Is it
> v2 or just duplicate?

Sorry for the inconvenience: it is a duplicate, indeed. The patch went
out a first time with a misconfiguration in my git config sendmail and
I didn't even see it appear on patchwork. I expected it wasn't
delivered at all: looks like it landed with a 2 days delay...

>>
>> Signed-off-by: Andrea Galbusera <gizero@gmail.com>
>> ---
>>  .../recipes-extended/libconfig/libconfig_1.4.9.bb  |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
>> index c7d3cf7..22eecf8 100644
>> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
>> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
>>
>>  SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
>>
>> -inherit autotools pkgconfig
>> +inherit autotools-brokensep pkgconfig
>>
>>  SRC_URI[md5sum] = "b6ee0ce2b3ef844bad7cac2803a90634"
>>  SRC_URI[sha256sum] = "09c8979252e60193e2969e9b0e1cd597f7820087867989b2f0939ad164473041"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

