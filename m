Return-Path: <fedor@lightpad.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id B1AE76FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 14:24:16 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 38so77543372iol.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightpad-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=dirFAkZbThCOzlNQCCEvuVJtSsKhiNlnkIc1arv5iBs=;
	b=Fw/bxiPiSKKqfL5YLCfQ7WhG3wXyynHayYWyYdpW1s5g6AZFbWRJjZ6KOjxPfbFwg5
	+CgwaQd4sWjOd/ZGAiS1la1tv1ac55Z10VOo4thu9haqjcKMYeHE9TV7KnsT/yaXEbmu
	UVFH02PzPmqKNCh/F3fLLDWx5eOgd9e9spmRGsUQEBfxZzGgJNQPQERYU3SuON00gmic
	CuHzw5laUiKjjiDtZdgZ6JPrI24mM+zzjNoi8wNdr2F/KWVIYAU6eyMqxXrgQjrHx72J
	yTLK/4OKOBgUIHOsv0aoe9c7nMG8R2xxJeXZm2o0VqPt9kGJlh4wh/b3qRfcmxUo+MPC
	5WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=dirFAkZbThCOzlNQCCEvuVJtSsKhiNlnkIc1arv5iBs=;
	b=cqTzRKyFAwzE+P7Azx0koWrBIErlpS2gF/cMCa8Y9/2IAIME8NFvLZXboJgukPpo7t
	O5Sij+gkreVXwWlfDQlAtJgf0oSFc0Euj3HSh5HSNgej1ntBhdnS0wgtD/eAD4QTP67Z
	mNgE//2C9foZMUU2oJGT+m5B4BOh8mnz1JkyPzNUeb1EkMNGqwl0KfGmhKlOCk6hEd9Q
	UGv+suJGo/vEsvsZlrPjhmAUR/kwWW/ee2iWujNzqHOhc/eKcgITwq6R+V5l2suyYg7Y
	eWFTquZ3gNMWsEYvqmQGT6nRyBftM8Da6Q4GIBGOYSG3q9i410AaqTgmrWR9ndIlqeTu
	hHjw==
X-Gm-Message-State: ALyK8tKsyLNfj16wioA1qDpjgLkUATVlxsCx5z3VnCduAwjblUypGXBm7Wy/epkXMiyJb6JJoM4VLxYLvqnOwvIL
X-Received: by 10.107.195.14 with SMTP id t14mr35623195iof.175.1469111056841; 
	Thu, 21 Jul 2016 07:24:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.78.3 with HTTP; Thu, 21 Jul 2016 07:24:16 -0700 (PDT)
In-Reply-To: <CAGreREwcXB2Gv65fndDFXDK7Ng1kPYvrbSgvMy4LKGfcsUj_Aw@mail.gmail.com>
References: <CAGreREwcXB2Gv65fndDFXDK7Ng1kPYvrbSgvMy4LKGfcsUj_Aw@mail.gmail.com>
From: Fedor L <fedor@lightpad.com>
Date: Thu, 21 Jul 2016 17:24:16 +0300
Message-ID: <CAGreRExRAEwWuw6-HJLyqS=4LVL26gO+rPakSZCbYJpcW+ybWQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Building OpenJDK 8 with X11 support
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
X-List-Received-Date: Thu, 21 Jul 2016 14:24:17 -0000
Content-Type: text/plain; charset=UTF-8

Hello,


I'm trying to get a Java application running on a Yocto Linux / OE based
(arm) board. The application uses Java 8 with AWT in headless mode. As I
understand, sun.awt.X11.XToolkit instance is still needed to get it running
even in headless mode.

I'm using meta-java layer from OE. By default, recipe for OpenJDK 8 builds
it without X11 support, so the application fails to run in such
environment.

To add X11 support I've created following .bbappend files:
icedtea7-native_2.1.3.bbappend
openjdk-8-native_72b05.bbappend
openjdk-8_72b05.bbappend

They contain one line only,
PACKAGECONFIG_append = " x11 "

I'm using "bitbake openjdk-8" to build it. The build of openjdk-8-native
fails with following errors:

build/tmp/work/x86_64-linux/openjdk-8-native/72b05-r0/jdk8u-e8bed1496ff2/jdk/src/solaris/classes/sun/awt/X11/XDragSourceContextPeer.java:369:
error: cannot find symbol
    private boolean processClientMessage(XClientMessageEvent xclient) {
                                         ^
  symbol:   class XClientMessageEvent
  location: class XDragSourceContextPeer

and a lot of similar errors - apparently wrapper of X11 API isn't found /
isn't generated?

So far I've checked icedtea7-native build (it succeeds) - and it is the
only place where the wrapper is generated, but I cannot figure out whether
it is packaged and uploaded to sysroot for openjdk build to use - and if
not, how to do that. Or maybe openjdk should generate the wrapper itself?
Anyway, I'm stuck; any help will be appreciated!


-Fedor

