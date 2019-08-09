Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id CB0417D476
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 19:36:51 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j19so60244242otq.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2019 12:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=cN2DunCb0G53Is2PldAr8Zkuw0dVTohJLVg+sZTy+G0=;
	b=oPZwSZNqf77bpgIUpz1iKgse+rQG+G0YiPEL215tvnlTKi6y/pS4GDOaUGzd0cMjCj
	h7LFjwf5jlUaC69B8W7FBHqO/cIMDMOIcOUZaVXfxPwomqqflbkoekUaJ36CsFUbSkNE
	AS7/Y1BS909xGZ5e3mXKtgklT2Ad4Chd38NKSohX/EzhccIO4zuQfGOHrzR7BE7+1QBt
	kNdQdY+TREo7Eizj95O/jDyiMcCpCXxzP/TNJyH+a8cTLQzUNKHjhPa7DsS+vJ08Q16J
	+hHZDvFW3Enbum1WOFqBKCQwf05CxIy4DPROt+74hK29AAFe2tje3aajG2lVyG1a11Fs
	ofJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=cN2DunCb0G53Is2PldAr8Zkuw0dVTohJLVg+sZTy+G0=;
	b=uKGRBmEJeoIMZKt52gmYkpkQGcdN2Sn3/EZ5IqIwjs+OREmLm5Vz9gWrAR/a5XVdfC
	UHgZ4A+ZxQJh223m9I9y956GTm4gcPKqLhtEPP9SP5igfBECyUikw38hpdTryO+m1eP1
	SP52MlRuC6WT1TExX5Uo2rapI4L4SPAwlyLBcXEKIv20On+BIYG3/amAGklTL9dM/5CD
	hdMrUSFAZQvFBh4gVH/9A+7a0GiTLCEBYYfdUAUo1pyRUTpJ5XDDnenx3zJqjoSzmEl8
	8lfLIzuswDPl3ySFB7PNUBAWdm2dD2GeNunmmvIzCATXPCAriascjN94mTfLIVeeekU+
	vj0g==
X-Gm-Message-State: APjAAAUqL52OHyn+5d7GvDcFpHHviRwvx4X0EkNgSMhWPQSt0xQvixEk
	SLoyIT+GsIDkjfQBYtHPatGQr7NzvraWOg==
X-Google-Smtp-Source: APXvYqzZDfENKnueGghBJHSOCGR7jXT0vhovcwdmtBJDZMaDhYqhOrBF/b+WMIIe73eg9hdmnCL2Vw==
X-Received: by 2002:a05:6830:119:: with SMTP id
	i25mr20217021otp.288.1565379411715; 
	Fri, 09 Aug 2019 12:36:51 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
	[209.85.210.45]) by smtp.gmail.com with ESMTPSA id
	e205sm34169399oia.23.2019.08.09.12.36.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Aug 2019 12:36:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f45.google.com with SMTP id j19so60243583otq.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2019 12:36:50 -0700 (PDT)
X-Received: by 2002:aca:f084:: with SMTP id o126mr6710607oih.37.1565379409534; 
	Fri, 09 Aug 2019 12:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190809092013.32650-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190809092013.32650-1-rasmus.villemoes@prevas.dk>
Date: Fri, 9 Aug 2019 16:36:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoV=wNxrhyapU6rud+YzSK3AOdVc-VXi0qnQrXzKjPNDA@mail.gmail.com>
Message-ID: <CAP9ODKoV=wNxrhyapU6rud+YzSK3AOdVc-VXi0qnQrXzKjPNDA@mail.gmail.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
X-Mailman-Approved-At: Mon, 19 Aug 2019 08:55:33 +0000
Cc: Maksim Sisov <msisov@igalia.com>,
	Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>,
	Jakob Dyhr Thomsen <jakob.dyhr@prevas.dk>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Jonas Suhr Christensen <Jonas.Christensen@prevas.dk>
Subject: Re: [meta-browser][PATCH 1/2] chromium: don't pass is_official_build=true when doing a component-build
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
X-List-Received-Date: Fri, 09 Aug 2019 19:36:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 9, 2019 at 6:20 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> When setting the PACKAGECONFIG component-build, the build breaks
> immediately due to this from the toplevel BUILD.gn:
>
> if (is_official_build) {
>   # An official (maximally optimized!) component (optimized for build times)
>   # build doesn't make sense and usually doesn't work.
>   assert(!is_component_build)
> }
>
> So we must make is_official_build the negative of component-build.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Good, please open a PR on GitHub so we can merge it :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

