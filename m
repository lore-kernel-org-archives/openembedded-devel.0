Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 49FEB6059F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Dec 2016 12:49:17 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id c47so410630695qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Dec 2016 04:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Or4WCKoZLCCoMrPC6g9bj5V9L9AXG1lR2wL9uCei+us=;
	b=Ptq3hj1uW31NTMRE6exxlgJG6eQsDUKi6mBaPO1iY7Xol5gnMA6UV5lVCxn86sJWrc
	wnQ+YTn3fvaRdNZvQ80TsuMRBxurbc39vZOi4JN+552vmJQ7L3NmkjKLH8uuU04MdLv0
	geGfWb+xF67LOLstwbe8ZrZEMOHVN4bSs8dsTtOIcWycuL3CpUeDfo4HghdRbFd9PFJc
	Yea0lZm7ikA5o2kb3xTv6M8w8/wdLwZz3mGy+t7DYJ2Z0ANbefFXGVpl5bzTKNrG3q+U
	P2yK51Fs2dW5bznmI5nASmpI5SXNGBEtpfmsqiDR308qTRROBa4JrWxVX7a3pOxnB5hr
	fO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Or4WCKoZLCCoMrPC6g9bj5V9L9AXG1lR2wL9uCei+us=;
	b=dlhIqLBV2G3/QWCD6JlZpaxBPnMLIUUNqQnS0niNqsTdWGeiEghrao7cabrhCQuXag
	qN1xiN8Cy5Fvo7h7bqbChAZ39eFqirQputpwHqjlborPBq2kiRHB+ic54lw/sjbdY2Q5
	NsxZEEwb2Y0RavIDXQpewZkGRJzfKG9njYkDwSsma1nfaeHb2MhWYuqOSIObDyBeDI7S
	tvbg2Eem+qbbnctN0Q48LE3RBhOTF4h0AWTwluMKdYFzcdbgRGnRaPwEjRRrf2XOLwbr
	rbMgXMsfyIwVNOJNGciYrvVP4KlUWFlNMAckeIiAobhY+vu8lf8AIQPsM+kI7BSiJFxP
	kDyA==
X-Gm-Message-State: AKaTC01k4jrVWnT1Gu1aGdnKmTiuyPTe7yd7T5HhZWBEX3YCEfo9G0myhfYM2WccEvJXuBjKyXrvTi5ev6J68JEW
X-Received: by 10.237.61.42 with SMTP id g39mr71044772qtf.65.1481201358620;
	Thu, 08 Dec 2016 04:49:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 8 Dec 2016 04:48:58 -0800 (PST)
In-Reply-To: <CAMKF1sqLfgn9SKGWevkZDq88Bg8x-p6gqVbW9EfxrOdsDRzgag@mail.gmail.com>
References: <20161206023625.12901-1-raj.khem@gmail.com>
	<20161206023625.12901-4-raj.khem@gmail.com>
	<CALbNGRQ2CH59VL51BeaXs3PP9up=C=aAfVWOccYQqRH8QLrRig@mail.gmail.com>
	<CAMKF1sqLfgn9SKGWevkZDq88Bg8x-p6gqVbW9EfxrOdsDRzgag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Dec 2016 12:48:58 +0000
Message-ID: <CAJTo0LYVFBReMisTS3O1F8U0y31cZ+cOt7AcdeORqs8FtWXZ3w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-gnome][PATCH 6/7] gthumb: Add missing dependency on gnome-common-native
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
X-List-Received-Date: Thu, 08 Dec 2016 12:49:18 -0000
Content-Type: text/plain; charset=UTF-8

On 7 December 2016 at 19:40, Khem Raj <raj.khem@gmail.com> wrote:

> havent seen that fail. but probably needs similar fix.
>

Sorry about these - I thought I caught them all when I sent the patches.

Ross

