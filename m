Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0038877E71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Oct 2017 03:48:25 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id n89so368905pfk.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 20:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yH2QaHx8Y1Aqqhb8vglJp6fZUrFwmWuGxudVwCy4zOE=;
	b=Ujg1ODfU2VvieP0e/cIZM9+J+0kZzJMGgtSztfdTuidxkQDT1/0J/eFG3DxjXznJ8j
	3/gOkfC0lj8ByjicZuV9j/jOK9/WPjv3rzv2sKu9ikYLWys4FvBgDDw7E0d9MZIjRlZr
	C6DCUElUir5UdInI+q+eq+xEsuF8/l4XuGK2ybbON0o9qTLZ2632O16Dguddxei8Vfy8
	v2ySqXTkruRcjQC5YkjAuZ033Shq6T2ISGJ11DlY3YVNpsjqB94J7MTJRUJS0U1VwIIp
	72hlFlHNcSiF/2FD9/Y42/BOlJYESFEslcMz3QxxWegpUxJKR1vldOqGrvzx6dQspTR1
	WSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yH2QaHx8Y1Aqqhb8vglJp6fZUrFwmWuGxudVwCy4zOE=;
	b=X0E056xn4Q1oBIBaXeB4bb+c+BSLkbjj3FqDchpyKPIkOUOiIUyFvoi5WHAMUEc9CF
	50nq6F6Kl9ofme3nSqyni0RFQCdBMe8RjZYcxvVgMIQxXP88VjXLmqzzPCFdD1XDDRTd
	Y1ix5wlVyyPSl5csiY226YOYtdyNTcJKb8TH6s1dHBOMbxFAcpgZCv2uN++eWZqRh1yM
	U1iqlzi7FsVNJrF1hmleDC9QCWCbqUEqXPJJh8h6Ek2A2oNpJPTW62y6kY2XFZmmRaa+
	whSeJcwGDNS40DxecTla86EIa5V9wyvCFxYrOVOtSGDoVCkyEblwsyzANQdCH9jchrd0
	qUIQ==
X-Gm-Message-State: AMCzsaUPoUfziZTaN7nL2TbDj/c96mjIXYN+EOGa9DLupN3OxuLAsnXb
	J4xwznEgrZQzbsixaaq8iARITA==
X-Google-Smtp-Source: AOwi7QDNe0GXitLO19zBKRYzji/8Bp+tKNXqyBOSmeRpUvW7Rn51w8KKs9cPSrksfY9Q4/5FbUBYzA==
X-Received: by 10.99.109.2 with SMTP id i2mr96974pgc.194.1507866507185;
	Thu, 12 Oct 2017 20:48:27 -0700 (PDT)
Received: from apollo ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id l79sm83022pfb.33.2017.10.12.20.48.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Oct 2017 20:48:26 -0700 (PDT)
Date: Thu, 12 Oct 2017 20:48:25 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20171013034825.ispcwc762ls3ttes@apollo>
References: <20171003234535.GG16828@denix.org>
	<20171013012110.GM9221@denix.org>
MIME-Version: 1.0
In-Reply-To: <20171013012110.GM9221@denix.org>
User-Agent: NeoMutt/20170912 (1.9.0)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: nativesdk-qtbase 5.9.2 C++11 errors with gcc 6.3?
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
X-List-Received-Date: Fri, 13 Oct 2017 03:48:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2017 at 01:21:10AM +0000, Denys Dmytriyenko wrote:
> Khem,
> 
> I tried following on your suggestion to add #include <cmath>, but it is 
> already there in src/corelib/global/qnumeric_p.h
> 
> Not sure why target qtbase builds fine with oe-core gcc 6.3.0, but 
> nativesdk-qtbase fails with this error... Any more ideas? Thanks.

Do you use uninative ? if not then try with uninative. 
It seems to be mixing headers from your build host and nativesdk sysroot
there could be several reasons for that. You can also try to build on
a different distro on host may be one which has gcc6 as host gcc.

> 
> -- 
> Denys
> 
> 
> On Tue, Oct 03, 2017 at 07:45:35PM -0400, Denys Dmytriyenko wrote:
> > Martin, Khem,
> > 
> > Have you tried building Qt 5.9 with gcc 6.3 from oe-core? I'm seeing bunch of 
> > what seems to be C++11 related errors during do_configure of nativesdk-qtbase. 
> > Target qtbase builds fine and switching to gcc 7.2 seems to resolve it as well.
> > 
> > Any ideas or pointers? Thanks!


> > 
> > 
> > Errors are like these:
> > 
> > In file included from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> >                  from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: In function 'bool qnumeric_std_wrapper::__builtin_isnan(double)':
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45: error: '__builtin_isnan' is not a member of 'std'
> >  static inline bool isnan(double d) { return std::isnan(d); }
> >                                              ^~~
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:45: note: suggested alternatives:
> > <built-in>: note:   '__builtin_isnan'
> > In file included from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/recipe-sysroot/tmp/sdk/sysroots/x86_64-oe-linux/usr/include/c++/6.3.0/cmath:45:0,
> >                  from ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:56,
> >                  from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1,
> >                  from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:104:20: note:   'qnumeric_std_wrapper::__builtin_isnan'
> >  static inline bool isnan(double d) { return std::isnan(d); }
> >                     ^
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: At global scope:
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:105:20: error: expected ')' before '(' token
> >  static inline bool isinf(double d) { return std::isinf(d); }
> >                     ^
> > In file included from ../include/QtCore/5.9.2/QtCore/private/qnumeric_p.h:1:0,
> >                  from /OE/master/build/tmp-glibc/work/x86_64-nativesdk-oe-linux/nativesdk-qtbase/5.9.2+gitAUTOINC+73573fce29-r0/git/src/corelib/tools/qarraydata.cpp:42:
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h: In function 'bool qnumeric_std_wrapper::__builtin_isfinite(double)':
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48: error: '__builtin_isfinite' is not a member of 'std'
> >  static inline bool isfinite(double d) { return std::isfinite(d); }
> >                                                 ^~~
> > ../include/QtCore/5.9.2/QtCore/private/../../../../../../git/src/corelib/global/qnumeric_p.h:106:48: note: suggested alternatives:
> > <built-in>: note:   '__builtin_isfinite'
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

