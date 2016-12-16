Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3E42277389
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 09:21:31 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id p9so85783333vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 01:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Dcis1gO9bPlCMchDvWm0dWPewRbt+Ac1ZwSUkXFlqYc=;
	b=CuqaENNg+zfgXT+5CGfWd/9v1a7oJQ7y5O+iwhhlCgKd/cUcAPCWGErmlDzXa8n/dt
	VUrtSyEZzaSCRn6/RA0zrOIcH/spOZF8b7S8a2gcLDuldqxefoj65ydbDeGGHwetNFEC
	kgI358DQFodOIfjz0B4b8+eN8PRIjvJJ/VRBE7sVGghWjQZ8bImnIiEY6hLWZb80jkxr
	p/20LyZePv1wzkIq0hfE4E41vRg7bSe5J+SY8p4L0tPomXsJl1TUITrOOengwNdd874g
	+1X4XxtpHLfVlMe9MOTSJxMPtt04fqEoki5rj5Bzt2qwc9xqHqdVYJ0LMgB2uP82HHt/
	US9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Dcis1gO9bPlCMchDvWm0dWPewRbt+Ac1ZwSUkXFlqYc=;
	b=qO7WmV0CJJQMixYQpQbdLGTGTiwKux3m/lj7sCw8uHGJWW4qdH/UbkTgnj/gW6eTjX
	eQsnFjB+UDf8Q4dtrLZYPLQcxfcq0DoFCcsH9q/yAFPctTDmzM9iLg2MNdvEDHQLIC/w
	OUifD/LmFCy9um4utTdbVVy/Uo+BNRXmeDSvDsHThjb+7HODCVk8YVuPAtkfhHznarqA
	O+Uw5N94bvfRS5G0uBqUvjK8SaiH4jwyFShuWoL2jFtJxuOoHbU/E3eT7I/wXs0x+zR9
	GpvnVLlXApT+FbT4k6oeLow50ojZQKRWLkNgptn0Cwcl3I0PoZl3Udq9DPqVoCdFkmGY
	C//w==
X-Gm-Message-State: AIkVDXLGzgx9WdMYfh8QGNEw0U6knLoSkmDKBV5F6LX3l9LAAPkSiTWAqjA9W5xBlJJYanRTVo+rGAz4G9UkXQ==
X-Received: by 10.31.88.1 with SMTP id m1mr796410vkb.83.1481880092269; Fri, 16
	Dec 2016 01:21:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Fri, 16 Dec 2016 01:21:31 -0800 (PST)
In-Reply-To: <CALbNGRSD5thQE61ov3Jqrj1aHFWavqGD-Q_0vhTAJ7Jn-3rodQ@mail.gmail.com>
References: <1481755778-16443-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSX7gZwpAAKp0jiPp4CT+xUXHr6wU_Zs2n+ug7xwp2hHg@mail.gmail.com>
	<CALbNGRSD5thQE61ov3Jqrj1aHFWavqGD-Q_0vhTAJ7Jn-3rodQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 16 Dec 2016 10:21:31 +0100
Message-ID: <CALbNGRR76z4YUXGWK6sJJrkYhkn3Pff2nTP=XFGF9ORDuGn1Xw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 0/2] firefox fix build on oe-core master
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
X-List-Received-Date: Fri, 16 Dec 2016 09:21:33 -0000
Content-Type: text/plain; charset=UTF-8

>> And again sent out too early firefox still fails - continue with V2 :/
>>
> really wonder how the last system nss/nspr patch was tested...
>
commit 7093c4fd1a131f99810423404ce11d554d6aae78
Author: Takuro Ashie <ashie@clear-code.com>
Date:   Thu Dec 15 09:43:36 2016 +0900

    firefox: Use system-wide cairo instead of built-in one

    Signed-off-by: Takuro Ashie <ashie@clear-code.com>

Seems tghis one turns fonts in address field invisible...

Andreas

