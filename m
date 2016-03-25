Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id F18CD6E666
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 10:12:12 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id x3so79872157pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=4SDdwN+uRN46g4NVo4in+oZlyrslnc/XQQ/hJVAnbMw=;
	b=Bv0ZEz5he+6AOWxHnWtMK1KTwA6AmThivHWVOrRXpqWs3b73TbT+PR3cFzh2iFGNd+
	pQnztrTJane0ad44VBLkLn/xqIcO87sJvIKnwGXIcu4nXNM50XSIWorZXtIPGhdU847W
	rLdUTFnrOohKbMx/v+k84pD6EVsYkmI2KTIkdGztAr5hvnLZh9OK7Dx0wjsTduL+50It
	TRXkOsLXe5xMr53EX6ZCQKd7BS+Uz1bcqFufNBAN7aHt+lfBQQHnkRQuQt42gd4C9Qlj
	Vo0/jmg/4AbpYt1CI+ykGPFZrXB7gEbe70Qx1TLm0oz5OsxWthkUX07FdjVCm9/jieI8
	8Gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=4SDdwN+uRN46g4NVo4in+oZlyrslnc/XQQ/hJVAnbMw=;
	b=C9Hq/2nQqFuhTTv/iB/p+hRIFePHxbXwB8w8tCulUUKT8LmuN1m16UX5UvfnxDNUO8
	98uzwTEfnPeyio11hVYgHCYg6qRG8cMjX3drWBLkKV7PeWenhAiFKm906RtW2oxWMwD6
	XMiZinKv1jP4uf+ra+3YCP5wqXQMuGl6c1XhuV/VY0/AivkbiNwRBlTBhZiY7WcsXx7/
	MSfJrlPC9+MNMkOGd2B61Dg5FKVvsIXC9sZ8KyFnThOS2mleTc+WRtyhOl50g3Gi50G7
	GYVliHYqlRNbsIFvb37q26q0cv/iKC4m5E85NF/ucA2RH4QtfX57LePXv3QtLNv8S5df
	2HGw==
X-Gm-Message-State: AD7BkJL4oAiYlXlj//8CglllKrZR9FypCfZ6dWbcq5TzWPl5o9KLLuDFPqMtJc0hw7LjaQ==
X-Received: by 10.98.14.2 with SMTP id w2mr19811284pfi.35.1458900732942;
	Fri, 25 Mar 2016 03:12:12 -0700 (PDT)
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com.
	[209.85.192.177]) by smtp.gmail.com with ESMTPSA id
	l4sm15444246pfi.73.2016.03.25.03.12.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Mar 2016 03:12:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f177.google.com with SMTP id u190so80080359pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2016 03:12:10 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr19724400pfb.141.1458900730601;
	Fri, 25 Mar 2016 03:12:10 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Fri, 25 Mar 2016 03:12:10 -0700 (PDT)
In-Reply-To: <1458868914-30827-2-git-send-email-guojian.zhou@windriver.com>
References: <1458868914-30827-1-git-send-email-guojian.zhou@windriver.com>
	<1458868914-30827-2-git-send-email-guojian.zhou@windriver.com>
Date: Fri, 25 Mar 2016 07:12:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr=KKgoj9xFQAfB-2wr60DEL6KMrr5ft9ezQMRJ_3YnKA@mail.gmail.com>
Message-ID: <CAP9ODKr=KKgoj9xFQAfB-2wr60DEL6KMrr5ft9ezQMRJ_3YnKA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] firefox: fix install issue and do_package_qa issues
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
X-List-Received-Date: Fri, 25 Mar 2016 10:12:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 10:21 PM,  <guojian.zhou@windriver.com> wrote:
...
> 2. Add the "--libdir=${libdir}" into the EXTRA_OECONF to make sure these
> library files could be installed into the /usr/lib64 in the 64 bits OS.

This should be set, as prefix, in firefox/mozconfig.

All the rest looks fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

