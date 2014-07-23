Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 890BE6FEA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:49:37 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so2149296pad.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 10:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type;
	bh=snHN8LYpBk/89KoaKgI74L3AWe22YSU/aOF1UubfTgc=;
	b=bXYWCpIONmmvOc5FCfp3Z05Bh1hmf64cEabRUCfERdSHHGA67/w4y7PIoKxTwjFOwZ
	NUBUyRuZZMNwZwk1BAxyrnSb7NJuvM8F8IfYBkLagpLwCRHBHTCi+8sxazmh83g34jlA
	NMN1AMMN0PFLyD4h0PWye4IsJBrO+y7c8fP/VCIISqwUQAia8w6CfV4DcOIjZoZOYtpr
	ESn1bCy2GI+fELeRf1zvFyKvOfkkhhY9Q7OZUjFnaybILbdFIpekJXIpm5pP8flkXJnr
	y7AV8zulp+HrA6WeZoPZU2w2eAK/w44XiQxM4bFDCQouUxJ4ACnJbbCg0XY+mgG95g02
	DnQg==
X-Gm-Message-State: ALoCoQlkuhlii7b0oeKpsOZzewHHftn6Z5AkleXj0Xc0UjlfU07FwfXayjTOQ2TmoYt9P4EEaUgu
X-Received: by 10.70.33.102 with SMTP id q6mr3944851pdi.39.1406137778401;
	Wed, 23 Jul 2014 10:49:38 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id n2sm3988514pdo.32.2014.07.23.10.49.36
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Jul 2014 10:49:37 -0700 (PDT)
Message-ID: <53CFF5AF.1040902@mvista.com>
Date: Wed, 23 Jul 2014 10:49:35 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1405981228-26871-1-git-send-email-akuster@mvista.com>
	<20140723135616.GD22875@jama>
In-Reply-To: <20140723135616.GD22875@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] v3] Wireshark: build fix and recipe update
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
X-List-Received-Date: Wed, 23 Jul 2014 17:49:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit




On 07/23/2014 06:56 AM, Martin Jansa wrote:
> On Mon, Jul 21, 2014 at 03:20:28PM -0700, Armin Kuster wrote:
>> Backported Arm build fix
>> Added gtk3 support
>> Cleaned up PACKAGECONFIG options
> You cannot use IMAGE_FEATURES to define PACKAGECONFIG, see what I did
> with it in master-next (and confirm that you're ok with my changes).

ok. thanks.

Changes look fine.

  Signed-off-by:  Armin Kuster <akuster@mvista.com>


>
> Also please notice wrong number of ']' in subject, no big deal, but I
> had to strip 'v3]" from subject lines manually when cherry-picking from
> patchwork.

thanks

regards,
Armin
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   .../files/va_list-can-t-be-NULL-on-ARM.patch       | 98 ++++++++++++++++++++++
>>   .../wireshark/wireshark_1.12.0-rc2.bb              |  5 +-
>>   2 files changed, 102 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch
>>
>> diff --git a/meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch b/meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch
>> new file mode 100644
>> index 0000000..301c381
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NULL-on-ARM.patch
>> @@ -0,0 +1,98 @@
>> +From 320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4 Mon Sep 17 00:00:00 2001
>> +From: Steev Klimaszewski <threeway@gmail.com>
>> +Date: Thu, 19 Jun 2014 16:54:57 -0500
>> +Subject: [PATCH] va_list can't be NULL on ARM.
>> +
>> +Bug: 10209
>> +Change-Id: Ibd63a530450b7d2d4ec244e91c77caa731ba63aa
>> +Signed-off-by: Steev Klimaszewski <threeway@gmail.com>
>> +Signed-off-by: Balint Reczey <balint@balintreczey.hu>
>> +Reviewed-on: https://code.wireshark.org/review/2464
>> +Reviewed-by: Evan Huus <eapache@gmail.com>
>> +Reviewed-by: Michael Mann <mmann78@netscape.net>
>> +
>> +The patch was imported from the wireshark git server
>> +  (https://code.wireshark.org/review/p/wireshark.git) as of commit id
>> +    320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4.
>> +
>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>> +
>> +---
>> + epan/expert.c | 36 +++++++++++++++++++++++++++++-------
>> + 1 file changed, 29 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/epan/expert.c b/epan/expert.c
>> +index 46be838..a69566d 100644
>> +--- a/epan/expert.c
>> ++++ b/epan/expert.c
>> +@@ -381,15 +381,26 @@ expert_set_info_vformat(packet_info *pinfo, proto_item *pi, int group, int sever
>> + 	tap_queue_packet(expert_tap, pinfo, ei);
>> + }
>> +
>> +-void
>> +-expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expindex)
>> ++/* Helper function for expert_add_info() to work around compiler's special needs on ARM*/
>> ++static inline void
>> ++expert_add_info_internal(packet_info *pinfo, proto_item *pi, expert_field *expindex, ...)
>> + {
>> ++	/* the va_list is ignored */
>> ++	va_list unused;
>> + 	expert_field_info* eiinfo;
>> +
>> + 	/* Look up the item */
>> + 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
>> +
>> +-	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
>> ++	va_start(unused, expindex);
>> ++	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
>> ++	va_end(unused);
>> ++}
>> ++
>> ++void
>> ++expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expindex)
>> ++{
>> ++	expert_add_info_internal(pinfo, pi, expindex);
>> + }
>> +
>> + void
>> +@@ -406,22 +417,33 @@ expert_add_info_format(packet_info *pinfo, proto_item *pi, expert_field *expinde
>> + 	va_end(ap);
>> + }
>> +
>> +-proto_item *
>> +-proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
>> +-		tvbuff_t *tvb, gint start, gint length)
>> ++/* Helper function for expert_add_expert() to work around compiler's special needs on ARM*/
>> ++static inline proto_item *
>> ++proto_tree_add_expert_internal(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
>> ++		tvbuff_t *tvb, gint start, gint length, ...)
>> + {
>> + 	expert_field_info* eiinfo;
>> + 	proto_item *ti;
>> ++	va_list unused;
>> +
>> + 	/* Look up the item */
>> + 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
>> +
>> + 	ti = proto_tree_add_text(tree, tvb, start, length, "%s", eiinfo->summary);
>> +-	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
>> ++	va_start(unused, length);
>> ++	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *eiinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
>> ++	va_end(unused);
>> + 	return ti;
>> + }
>> +
>> + proto_item *
>> ++proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
>> ++		tvbuff_t *tvb, gint start, gint length)
>> ++{
>> ++	return proto_tree_add_expert_internal(tree, pinfo, expindex, tvb, start, length);
>> ++}
>> ++
>> ++proto_item *
>> + proto_tree_add_expert_format(proto_tree *tree, packet_info *pinfo, expert_field* expindex,
>> + 		tvbuff_t *tvb, gint start, gint length, const char *format, ...)
>> + {
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>> index 66716c3..47e72f4 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
>> @@ -14,6 +14,7 @@ PACKAGECONFIG += " ${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "gtk2 grap
>>   PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
>>   
>>   PACKAGECONFIG[gtk2] = "--with-gtk2=yes,--with-gtk2=no, gtk+"
>> +PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
>>   PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
>>   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>>   PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no, gnutls"
>> @@ -22,7 +23,9 @@ PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes,--with-gcrypt=no, libgcrypt"
>>   EXTRA_OECONF = "--with-gtk3=no --with-qt=no --enable-usr-local=no -enable-tshark"
>>   
>>   LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
>> -SRC_URI = "http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2 "
>> +SRC_URI = "http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2.tar.bz2 \
>> +    file://va_list-can-t-be-NULL-on-ARM.patch \
>> +    "
>>       
>>   SRC_URI[md5sum] = "dc1149073066a29f91116c168558262e"
>>   SRC_URI[sha256sum]= "31009bb450126e9b12808267419f31016d14e6fde7b5e39c85ad37459908cffb"
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


