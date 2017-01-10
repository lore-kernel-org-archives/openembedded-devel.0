Return-Path: <b.hutchman@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1F372719DA
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 22:07:30 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a197so141774808wmd.0
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 14:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=v6VYNr3+UvCfwiY1DuYoNCVZkxuD8eWW9v6oMN2lDxY=;
	b=Ks3CSBFxrn4vhYDVWDJBW70JPWzqq8IgbvYKDOipHn5rEmVWogoSWNmRHzLdTEIzlz
	uvuTUnSo5O6iBWPJakAgut5bcZ65JimBvi1UEGInNNFMGhxxWpGiiAd9LlN76RwwGWmL
	+DwNau9c/NaiU9hMTSxBqktnvIJNgKVqU89lfEHPJ1A4s1pb+cBogtnhbd3PSTavMeN/
	Oan2MMDe77ybTXE4Ft9KU9SvDLRf1c1wxfTpeTJ78S+pNq7UyzOouYkU/t1KYHbLQsca
	pbyVNshEshRuX1tUyPiip/mLORDZez1S1TZ5uBjRDTPr8NEAauvU0cCBEGouf5wGMIeE
	8jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=v6VYNr3+UvCfwiY1DuYoNCVZkxuD8eWW9v6oMN2lDxY=;
	b=c73YgrITpVUJTl1m6nNY/VOg+56zJYYbehwEYX8ukuIzjE+2uOg2GOdec16qa+nq8z
	xWRy+Ll7pxrgxQH4F7YcIfjt7SxlONdgOJ3lK6Sji8nH19zpWjO5InJCJBZdPMmNu8uB
	lqJ7LXV2RrxKS1WiY49H+MjDkUNTChJgS10Y0vi+VwTExKZuBNNRPRrlbKueJAsJ6ogq
	D3oSCZK1Tvw+lxjAOA2mUZAZiOD11h8mRtTwq1DLcA4XgUndHy2fv/lt5ts7/etC1j/Y
	BsGr/6CgTLXqrAH4KQvgx6i98YWvi/IBIYCD+Dd5jWNxOnQOoYxrenVOOc8kjHugKtIw
	Jg7g==
X-Gm-Message-State: AIkVDXJ/6Ak7Prig+MaybOETvQN18Q+853W8dH6eRnRBMtJlYYvvlIFcBf+biGeBakbYip3qokFI0HkKaXxwCA==
X-Received: by 10.28.142.16 with SMTP id q16mr2929352wmd.35.1484086050320;
	Tue, 10 Jan 2017 14:07:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.44.227 with HTTP; Tue, 10 Jan 2017 14:07:29 -0800 (PST)
From: Brian Hutchinson <b.hutchman@gmail.com>
Date: Tue, 10 Jan 2017 17:07:29 -0500
Message-ID: <CAFZh4h8iVD+ddmhzuBgcen4AhFhCVGE36z5KZaEBs9uOROsHgA@mail.gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: [meta-webserver]
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
X-List-Received-Date: Tue, 10 Jan 2017 22:07:31 -0000
Content-Type: text/plain; charset=UTF-8

In both krogoth and morty I get the following error trying to build apache2:

WARNING: apache2-native-2.4.23-r0 do_fetch: Failed to fetch URL
http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2, attempting
MIRRORS if available
ERROR: apache2-native-2.4.23-r0 do_fetch: Fetcher failure: Fetch
command failed with exit code 8, output:
http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2:
2017-01-10 16:47:16 ERROR 404: Not Found.

ERROR: apache2-native-2.4.23-r0 do_fetch: Function failed: Fetcher
failure for URL:
'http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2'. Unable to
fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/hutch/yocto_2.1.2_bbb/layers/poky/build/tmp/work/x86_64-linux/apache2-native/2.4.23-r0/temp/log.do_fetch.17534
ERROR: Task 1098
(/home/hutch/yocto_2.1.2_bbb/layers/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb,
do_fetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1033 tasks of which 0 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/hutch/yocto_2.1.2_bbb/layers/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb,
do_fetch


If I go to the URL in the recipe there is no httpd-2.4.23.tar.bz2.
Looks like it's been replaced with 2.4.25.

Regards,

Brian

