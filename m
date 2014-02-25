Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id BCFB3605F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 23:35:33 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id w7so215163qcr.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 15:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=NjRr30TFfBho7ZEZDcgqTbspJMVZBkMVnFR2WNxW/I8=;
	b=ZyX4LUKpTnW1cVjl+Un0bbbcvHJO/xis2DGao+opW4QTZIvCbScYFss0pPjtJ22gXX
	7q4JBLFclvU4KhZFZSAQiGBlQTIQyw/9sHk1eB4tTF9e8Ct5qgebZKz+9Jfw1i0RHlN9
	TpAXk3SPPKEjTmys59YHxK5acORYHiYZBMvu6Z8wTPH7KKnDCX6mFNuJqecpZYV8imPG
	ciM9xzt2BH5CdGjhXQDUoIVo+/4OBjGUZL13o2hJ+dTdtDt9IK1DlFDscyVzShk9RuUb
	16/+whhJfQDCiuvJEOfgm29Yqh93ZjUhIyMQh/mYx2LFSQERohmtua5mCPF5YhdK0oi/
	IJHg==
X-Gm-Message-State: ALoCoQkTSXNbHX68HcFUsFOwfIZlmCfQk3pCGLO82+t1Q9MrFpbyqgDJ0CI8EY1zbZwOYmKgWJSM
X-Received: by 10.224.98.139 with SMTP id q11mr4069236qan.64.1393371333881;
	Tue, 25 Feb 2014 15:35:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 25 Feb 2014 15:35:13 -0800 (PST)
In-Reply-To: <CAFeBWL7cBFK-VH1NkGr-tMbM_wDvCGNxWaZwxEt9NJoECVS-QQ@mail.gmail.com>
References: <CAFeBWL7cBFK-VH1NkGr-tMbM_wDvCGNxWaZwxEt9NJoECVS-QQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Feb 2014 23:35:13 +0000
Message-ID: <CAJTo0LZVQMrn8bjH2YfTqufsQMHX5YWi61T3t8VRY4wW67uAbw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: NetworkManger's glib schemas are not getting compiled
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2014 23:35:38 -0000
Content-Type: text/plain; charset=UTF-8

On 25 February 2014 23:08, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Hello everyone, I'm on 1.5.1 at the moment. My image includes XFCE and
> Gnome's Network Manager. The network manager applet cannot be accessed
> because the schema associated with it is not compiled.

Try adding "gsettings" to the inherits list, that should handle the
schema compilation.

Ross

