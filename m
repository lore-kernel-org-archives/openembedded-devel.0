Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8D74D7D25F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 09:27:21 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c16so1688986ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 01:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x1JRK4pH50EIcJPqayB3WdKnUkFLAvMWoZS+IbtuLlU=;
	b=IqnjKsTFFHnX0jHJoP/aMrymHdevYUhM/dLCHzFG9JlOXRwyjwTXKu2M0zoi4iCO1L
	r+giQgmsFVUtVM77vnn2rzEFQrEmuqtfLYNNIevgL0HFT4K4r1zxfEYQzYSLaWBAuRCz
	EuYKGROeQzfzH2/hilmxF/SF7MO2lc2UjcX08SptF6PTz3FJzzIXNCb0azpNj3Vsyo5q
	md4DGQhOY2E6Syj6d0LG30Qe091+bbiKzQaMIxC9lj9VxJbelEEC1o6cxFCihpE9Y29a
	0aG/kKrrK7duxFET3a5SnI866aP6ykL5W5UMrISi51lm9+GBwz+vouEbqlryi2zUQnY3
	tUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x1JRK4pH50EIcJPqayB3WdKnUkFLAvMWoZS+IbtuLlU=;
	b=Vb+zXGSY6Q/Gl6vAQaFz0s7jDcmbaZNqC576Fp+6Hd0blSwrT0Z96IiE3TgCJY+8BJ
	sfhdTzS1hv4CQvgGiWeGO+emUUqJX6x+s7MnOUX8htraMZ4x3QMV0d/xtWno9fOSl8AB
	2+7UHPgsG9Dk2aE5lhQwQ+Zz98QNWNU43aUxvssKSwZ7UTHvjh7f45i4WfflbA+MV+/K
	qyHt/JZ6BJt4eAL2kOr0DJ81II6FA6+1qg10gUK70Oh7RkXRplOVEIkXb5Zs2Bqm8YYW
	eqeLIYBSJ+1wjKZQRIJDBjvf7v0euMEj9so1cLE6S1CJIA+U2YspDbrG+gjvq/PL4mDf
	N8gg==
X-Gm-Message-State: APjAAAWOkEmxUoDfySA4O4/GGS20eI3ox4EVk2caRFxYbm7HqYP2nGCq
	zBdTJ8Po+unY63RVIxKzXdLTLoUbyagC20P393M=
X-Google-Smtp-Source: APXvYqzATJjTQcpsFHn741A5O/+fsbiHoIwJscbhIVAOJe4WBXmds0vKgWFjznfAemvhD3VSOyw6LebRV3yLad9cs2c=
X-Received: by 2002:a5d:9f55:: with SMTP id u21mr7010954iot.224.1576229242821; 
	Fri, 13 Dec 2019 01:27:22 -0800 (PST)
MIME-Version: 1.0
References: <1576226743-346140-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1576226743-346140-1-git-send-email-changqing.li@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 13 Dec 2019 10:27:11 +0100
Message-ID: <CALbNGRTaVVnL6qPcnSqV6w+_o-ad3=GT3D=cWOLGGDUsuYJ0Rw@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] gtk-xfce-engine: remove this recipe
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
X-List-Received-Date: Fri, 13 Dec 2019 09:27:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019 at 9:45 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> * Part of xfce 4.14 changelog
>   Theme Engine (gtk-xfce-engine)
>       The gtk-xfce-engine has been deprecated and archived.
>
> * repo have been remove from upstream
>   https://archive.xfce.org/src/xfce/
>   no gtk-xfce-engine now
>
> so remove this recipe
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
Think this is a good thing and wanted to test it. Unfortunately it did
not make it into patchwork - similar as Kai's patches sent recently.
Who can look into patchwork?


Andreas

