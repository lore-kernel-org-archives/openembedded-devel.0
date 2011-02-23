Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Ps95K-0001wE-Dk
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 08:24:30 +0100
Received: by qwi2 with SMTP id 2so1770506qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 23:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=lrvPmWHHtKEdlkduS9tf7r41k9g2MsupP/pZiRDQ+5w=;
	b=QHgNnhn0g1AvUVhUGN9L4jY8q20I932hGh+lzQ2DtrEoC9ikHzCRbwJc7xWUZb8588
	5+DNXqFrEpWC/xtWatgczobqF2up1Bv1Yn4At/kDTD9OFZ4IQw7KMyopy6ipBFtN2QvN
	nUzNGqJvTsVeU805xAWkvwWoTA4lcuZHbMKXE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=RiTzi187vyzi5gql4Ak0Qd2G2GHIho4EVKvBfaM31es8EeAdqShO02Sp1U1PP7rMIK
	mfS7yjugD7hofgsr8bojzQxUCShtc2aie1YiZhrNCtbyh+10b8E+rAqLIjFOGk3l3oKy
	hL9GGJncCGTIiPn2qmC0LXqXLKs4YGIPJHQdo=
MIME-Version: 1.0
Received: by 10.229.78.160 with SMTP id l32mr2100843qck.298.1298445790574;
	Tue, 22 Feb 2011 23:23:10 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Tue, 22 Feb 2011 23:23:10 -0800 (PST)
In-Reply-To: <ik29om$8m7$1@dough.gmane.org>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>
	<1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>
	<ik29om$8m7$1@dough.gmane.org>
Date: Wed, 23 Feb 2011 08:23:10 +0100
Message-ID: <AANLkTi=rHvkbehQGEMgBdeO_7wFgGH-8EO+z-VVHcr3n@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCHv2] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Wed, 23 Feb 2011 07:24:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

we've come across this issue with linux-firmware:

---------- Forwarded message ----------
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Feb 2011 07:33:58 +0100
Subject: Re: [oe] [PATCHv2] linux-firmware: split into bus specific packages.
To: openembedded-devel@lists.openembedded.org

The wl12xx files need to go into /lib/firmware, not
/lib/firmware/ti-connectivity
-----------------------------------------------------

Grepping through kernel sources shows that that's the case:

filip.zyzniewski@jlime:/home/git/linux-hpc/drivers$ grep -r 'wl12.*\.bin' .
./net/wireless/wl1251/wl1251.h:#define WL1251_FW_NAME "wl1251-fw.bin"
./net/wireless/wl1251/wl1251.h:#define WL1251_NVS_NAME "wl1251-nvs.bin"
./net/wireless/wl12xx/wl1271.h:#define WL1271_FW_NAME "wl1271-fw.bin"
./net/wireless/wl12xx/wl1271.h:#define WL1271_NVS_NAME "wl1271-nvs.bin"
filip.zyzniewski@jlime:/home/git/linux-hpc/drivers$

Could you move these files to a location requested by the kernel?


bye,
Filip Zyzniewski


