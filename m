Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB28601D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:52:56 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id jw12so3458935veb.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 02:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=X4R/zFhkDT+WBsaIcwN2GMm6XboOi8SeXi/vQw90Ris=;
	b=XcuvgBqTgIOe7nYJAq6T0OgUrA27kcpqGD/JmX5T0NCb4FsbVEzqa9hf51t9gTAMjO
	D/SWWZhW7a1cYpY3Gl9nx7SlaepRyWjmTq1GlgVSSOgMSVLua0XsYBI3Lrw/A+HEuo2k
	kp9CDo0UNNv2cs8kuCebvMDmhQU6hzaNfK7ZUS3X+sZU7ukkiiYmRJ4zJAWRdkO1Q4gr
	NREd7P/gR++rPoPZZD05c/RPxVM93CndDTwLLevrqt0//Zve0On3ozjrW5v1Ldupqu0U
	ul04KBot+BIIg0YHa7dWuAOgdxviw2AzEjfX7cxy5SawdKs7QI5PwjAcIUcFex3R/BGW
	CgRA==
X-Gm-Message-State: ALoCoQnvcd6SJPQgUxQnD8O7wfNyXGg/TiJIBBZbNNEfjA07EfspIrzervvyebX2saAMrVPZG+8r
X-Received: by 10.58.46.84 with SMTP id t20mr3556443vem.56.1380016377635; Tue,
	24 Sep 2013 02:52:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 24 Sep 2013 02:52:37 -0700 (PDT)
In-Reply-To: <1380015325-28852-1-git-send-email-ml@communistcode.co.uk>
References: <1380015325-28852-1-git-send-email-ml@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Sep 2013 10:52:37 +0100
Message-ID: <CAJTo0LbB3U6GjzdGyc3Ff+gNjstYdy7B3KUNAEUBLuUebDTVNQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: Re: [meta-oe][PATCH 1/2] lm_sensors: add ALLOW_EMPTY to lmsensors and lmsensors-config
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
X-List-Received-Date: Tue, 24 Sep 2013 09:52:56 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2013 10:35, Jack Mitchell <ml@communistcode.co.uk> wrote:
> When building with dev-pkgs enabled I was hitting an error lmsensors-dev
> not available. Adding ALLOW_EMPTY allowed the empty package to be created
> and therefore satisfy the dependancy.

Your ALLOW_EMPTY statements only apply to lmsensors and
lmsensors-config, not lmsensors-dev (as you're using just ${PN}), and
surely you don't need it on the lmsensors-config recipe at all.

Ross

