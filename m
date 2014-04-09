Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 040F065DB5
	for <Openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 20:52:59 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wo20so3359290obc.33
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 13:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FCX8SIooZi9IJTvp8a7wsIaVlgG90Sv6jQB2DUixIC0=;
	b=we+0rTfFYhhOV0vxfR50O9UthSIAAtVVp9BFfdfUXh05KqHpmHSTM41NFJsxjQBuTN
	qRl+wbBZNibkioEiu7EbzkDBlLcs+ymfUzNJN+8WxpU0aslplQcFKSGKM/yjuM5vnNVD
	5OjeJvwAXs3nfE0Krm7D7JILsLd8mW+JyXlrFb3pO1XyIsztO6yJoT0jla+3NS5sdjGr
	cj2bxgVy4d+hMJzRSLMUSpAj3g2QeR4w2ETkiGAg7TmRp8QivBth5mTc6j/YDKr/5dzM
	dppfsM25jMP2VmTkQSxUqQ44eH4botbufojuTB60WjybYDpHai83vGaX3o+RrbXRVLJK
	uD3w==
MIME-Version: 1.0
X-Received: by 10.182.181.105 with SMTP id dv9mr3425626obc.59.1397076780384;
	Wed, 09 Apr 2014 13:53:00 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Wed, 9 Apr 2014 13:53:00 -0700 (PDT)
Date: Wed, 9 Apr 2014 16:53:00 -0400
Message-ID: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: udev auto-mount not doing fsck
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
X-List-Received-Date: Wed, 09 Apr 2014 20:53:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have a custom board that has a eUSB NAND attached (its a little circuit
board with a header Micron e230).

With the udev-extraconf package installed, udev looks like it automatically
mounts my device via the automount.rules (calling mount.sh) on boot.

I'd like udev to fsck this device before it auto mounts it.  Should I just
make or modify a udev rule to get this behavior or is there already another
package out there I'm missing that already has rules to do this that I can
use?  Don't want to reinvent the wheel if I'm just missing something.

The eUSB NAND has an ext4 filesystem on it but I'm starting to see some
corruption ... possibly from the journal getting messed up from too many
improper shutdowns etc.

Regards,

Brian

<http://layers.openembedded.org/layerindex/recipe/629/>

