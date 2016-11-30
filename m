Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 553 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Nov 2016 12:46:30 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id D378371A95
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DC73A31C1446
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:37:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id vtFzZN5MKdo7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:37:14 +0100 (CET)
Received: from [172.22.22.61] (55d44972.access.ecotel.net [85.212.73.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A982E31C19CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 13:37:14 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
	<1480507445-20746-17-git-send-email-obi@opendreambox.org>
	<CALbNGRQbW8hGvkCm5XZFKsNenpFcgtfAfHwbNTwcz9A1SG7_HA@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <07ce8c77-7c35-96a0-408e-bb9dbdb5358a@opendreambox.org>
Date: Wed, 30 Nov 2016 13:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQbW8hGvkCm5XZFKsNenpFcgtfAfHwbNTwcz9A1SG7_HA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH 17/17] Revert "samba: blacklist, fails to build with new binutils-2.27"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2016 12:46:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 30.11.2016 13:22, Andreas Müller wrote:
> On Wed, Nov 30, 2016 at 1:04 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> This reverts commit 80b2d4de0ee2a5e6a3302a527e3fcfd2b99c3e37.
>>
>> Disable cluster support, which causes the error.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> index 8c5f6d8..564b61e 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> @@ -81,7 +81,7 @@ EXTRA_OECONF += "--enable-fhs \
>>                   --with-system-mitkrb5 \
>>                   --without-ad-dc \
>>                   ${@base_conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
>> -                 --with-cluster-support \
>> +                 --without-cluster-support \
>>                   --with-profiling-data \
>>                   --with-libiconv=${STAGING_DIR_HOST}${prefix} \
>>                   --with-pam --with-pammodulesdir=${base_libdir}/security \
>> --
>> 2.7.4
>>
> Commit message confuses at least me - samba isn't blacklisted currently

Right. It was auto-merged with commit
3fdfdd8ff4f2cb8c70dd08d5c0cf363384259563 when rebasing from krogoth.

As your workaround from b60c60806e57f69233db582ef88d113867c2ecd1 beats
mine, please ignore this patch.

Regards,
Andreas


