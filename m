Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id BE56276E70
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:59:58 +0000 (UTC)
Received: by wijp11 with SMTP id p11so11047864wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 05:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=BbE6xqrpyaKIKLmONpB5Y2QB9UsAxbiSF77Fek6jTkA=;
	b=HH1RXmUVltNGTZUUYvG2Lvy3GaditxIbA8IcCyPXHNtroQ9KjIPaZEX/DGJ9jMkozX
	fpnt/6i6XGrJq/2v8fHW8DJGkmmntC6GqWegsENi0QeMNFL8YkvHYGkxePnV7GvNDqLi
	zDS9JvGX0tihuJJ6BQBxB1/h2EeyVIi4SjkEY/l40OmVId+IYcx9R74mAzpjL7ssLwts
	3aHe83AGnDSQwId366CwwEt0OLA7HNTXD67TAHgtN179E7GTE2b6TYwvRVf5D9+EWTzU
	Mxq2Rn+F/FFcKwdQMURp5eswGY4gn0F6xCqYds99/zMi1Ne5R/TX6dBqHkwR2EaLD+by
	N9xA==
X-Received: by 10.194.71.16 with SMTP id q16mr8331365wju.49.1446731998305;
	Thu, 05 Nov 2015 05:59:58 -0800 (PST)
Received: from [192.168.0.13] (lns-bzn-47f-81-56-255-191.adsl.proxad.net.
	[81.56.255.191]) by smtp.googlemail.com with ESMTPSA id
	q125sm8587041wmd.5.2015.11.05.05.59.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 05:59:57 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <1446722814-21435-1-git-send-email-funman@videolan.org>
	<563B52B7.1000403@opendreambox.org>
From: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <funman@videolan.org>
Message-ID: <563B60DC.6080705@videolan.org>
Date: Thu, 5 Nov 2015 14:59:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <563B52B7.1000403@opendreambox.org>
Subject: Re: [meta-multimedia][PATCH] VLC: make gnome-vfs configurable
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
X-List-Received-Date: Thu, 05 Nov 2015 13:59:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hi,

On 05/11/2015 13:59, Andreas Oberritter wrote:
> Hello Rafaël,
> 
> On 05.11.2015 12:26, Rafaël Carré wrote:
>> ---
>> XXX: to be cherry-picked together with <1446652999-24545-3-git-send-email-funman@videolan.org>
>>
>>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> index bf08405..ce6e52d 100644
>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>> @@ -60,6 +60,7 @@ PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
>>  PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
>>  PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
>>  PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
>> +PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnome-vfs, gnome-vfs"
> 
> this looks like a typo (missing dash in enable switch?).


Yes, although the typo is extra dash (should be --disable-gnomevfs)

> Regards,
> Andreas
> 
>>  
>>  do_configure_prepend() {
>>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
>>
> 

