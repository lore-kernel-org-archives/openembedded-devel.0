Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id F2DC06E666
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 10:53:27 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id c13so16663157lfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 03:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=sbfqbpjK821a1bq+3kWf82gzH8icgbD/udrUxiVO58M=;
	b=bGPrpeaoH8pyUxDfA8hXS067N3ifGMiskC/vWB15OfltMyLcI07OoWCQtdBPm/IO2U
	Sj+9NMAP5L2pM1yOgmg/8bxOjRkZck7Rgd4RN6E9GKEbOSiYs6Ld25xVtjFTlgwLhyGw
	+L19/isXE/XdrGkM17IatX4+IuDP9LhPfFfWcM5k0tIyVxVAEmi09qaIExHcjDmvmSnn
	SH7Bdasc1YLoEOJ/B43cznO9icpp3o1n/jp9yMrCWCQ9sH+3bAMqKm0hI6gN6VNr1yE6
	0TwJHqx+NQkbSjwDSXvwHG7tE0Itpjc9fCBrKgkgwQk7ipG5Jme8hvt/xhIcEOZlJG+f
	C0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=sbfqbpjK821a1bq+3kWf82gzH8icgbD/udrUxiVO58M=;
	b=LhQOgwhfK+pW4j74KvP8SrmClQcNkTerWb9epfIruLooBbxImSv3kwO6Xt3TvX3XnE
	TSovhdZ9L0o3TQCs/L4Yv/vgT6kSY2QnCtIJev8830wCPfNdpFXUJoPWrQL0JHayrOXo
	uvievG9W6ykzfyW688Kp0VJlKzAURmZGsJYXEhQocWq8T3VXEZ1ZHqDv/1XpcXt09KbB
	zAhMftJ7y3bTofAM4fGF8yXCeJihdOdTK4uYjmbb8RmzThWgMnKbZUagNlTGGeYUbIm9
	KFb90rj7LxXvPTcHTbKmHN1aFwyfWHK0cXnrEaC7MPCwzS8ZuDpXF/g1pZCddqAewUxM
	Xwow==
X-Gm-Message-State: ABUngvd7zBrSKzS8lg47uDasFGHwgdenicvOsYe6EZiQ/VZSRV9WMgJaPB1z08dz5fz/jg==
X-Received: by 10.25.93.67 with SMTP id p3mr20460262lfj.1.1477997608082;
	Tue, 01 Nov 2016 03:53:28 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-49-no126.business.telia.com.
	[213.64.218.49])
	by smtp.gmail.com with ESMTPSA id 76sm5344624ljb.43.2016.11.01.03.53.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 Nov 2016 03:53:27 -0700 (PDT)
Date: Tue, 1 Nov 2016 11:53:25 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161101105325.o4hcpm7p3ds7zvsh@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4d4b2776807f4f6e8480ea33a3a71c89@SEGOTNC5112-N6.vcn.ds.volvo.net>
MIME-Version: 1.0
In-Reply-To: <4d4b2776807f4f6e8480ea33a3a71c89@SEGOTNC5112-N6.vcn.ds.volvo.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161014 (1.7.1)
Subject: Re: [meta-oe] packagegroup-core-eclipse-debug
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
X-List-Received-Date: Tue, 01 Nov 2016 10:53:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Visser Sander (2) (Consultant) <sander.visser.2@consultant.volvo.com> [161031 21:10]:

> meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
> RDEPENDS on gdbserver but that is no longer provided. Should RDEPENDS
> on gdb instead?

Why do you think that gdbserver is no longer provided?

Sure, I haven't built master for some time, but it's still added in
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gdb/gdb.inc

Besides, what's needed for eclipse-debugging, is gdbserver on the
target.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

