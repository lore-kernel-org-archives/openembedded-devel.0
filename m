Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 043D76FF25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 09:27:42 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id ig19so6116507igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2016 01:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=f2P+HZ9b48Q1E3qt/LVp1XmPVpadnhcPvk3OE7JLa6I=;
	b=dw5p6detFOObipaGZwsUzutnx83Y7JlRKM+OVOxnYaXnTiiewhSpgtabd3MMRbgW6z
	myQQEs2msfQitK+oCO/zSn7JjaJjZkPc8lhiicBZ4EzZnHtHiRgx8uVV/W+W97LPDW8a
	3xO5+65NmNCz634p7MfI7NlbGUzzAGDFhKnG3M17ML+IG9hkrPWym/v940Lvtdpmo3/w
	OHF8sStaz9MPm/aieLf+pFCSZ/OiT58r94SSDpxXQRfRjYVvtSIEXDcOyzONw4nn1Hby
	7BILbE5DUK6J1vvXZefrUA0wgivxe5eubXb1KcPdi6wCCuymBv4yzJWBDN7i83nzEuOn
	Wh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=f2P+HZ9b48Q1E3qt/LVp1XmPVpadnhcPvk3OE7JLa6I=;
	b=LZpmvV/k1lKYisu2aaTJrCIDGhUIpFztjP0EfK5XJVZFFkndEDajheTkjUObae5tIs
	hXe5yULkzD4dm1GXHXTyFHMhvB3rEw9Nr+SvQUd8oI9cbY1NVMC3yqx3E9q/7qQbmYnX
	/BohrhaDDprIsNexLpk3zFSDDj2rlPtCkXuMaFBzuJcqxl1f7NUjvnNJEsJTfWI7i3Kw
	KYZCdMww4dNrmQ1VL4Iq5W0tOOiTFqwGndFoYkgts3OXmrvp6ITOGsdwEHyXYCwpwUDP
	SgTxSE9Y2NE7qX1GMw4bO33OdN5+azqT/RiZKA/S6C51pJs9MB1jvXhYloxMm8ejf++D
	C9TA==
X-Gm-Message-State: AD7BkJJAL/CHbHhZHrdBlJDlwlIzMHH8r7tJbhqJDqRD0YAybVjisEgXhFLVR42Ba6QXy3s2y4u3y4bYJCTpXNYj
X-Received: by 10.50.150.41 with SMTP id uf9mr1666034igb.64.1457688463442;
	Fri, 11 Mar 2016 01:27:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 01:27:24 -0800 (PST)
In-Reply-To: <20160310170841.GN2573@jama>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
	<41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
	<20160310142507.GI2573@jama>
	<CAJTo0LbHXD_C+Nm6bjV=xc6MRtMJ=Ry=_Q4YG-ihyWiWHaQ5UA@mail.gmail.com>
	<20160310161330.GJ2573@jama>
	<CAJTo0LZnsegS80eeExf27=DDytCotMRuYe8ryU7EWfEfWUOr-g@mail.gmail.com>
	<20160310170841.GN2573@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 09:27:24 +0000
Message-ID: <CAJTo0LZ1J85NgicMJfAUaYwTeh5H4hfcAxHumTu6HCe=3e_UDA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 14/38] python-gst: remove the 0.10 recipe
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
X-List-Received-Date: Fri, 11 Mar 2016 09:27:44 -0000
Content-Type: text/plain; charset=UTF-8

On 10 March 2016 at 17:08, Martin Jansa <martin.jansa@gmail.com> wrote:

> > Presumably Lune uses the BSP but not the software?
>
> LuneOS doesn't use frameworkd (which lives in meta-fso), but you wanted
> to nuke meta-smartphone which contains 16 different layers.
>

I guess I meant the openmoko-derived UI bits, not any BSPs.

Ross

