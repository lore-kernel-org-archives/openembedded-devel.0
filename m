Return-Path: <matt.hoosier@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id A345978352
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Aug 2017 21:45:42 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id q25so18764814uah.1
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Aug 2017 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=aO/FhLVXOr8zDRSpWOR6pQFj3ORHtEzn7+OJ2jq+YKY=;
	b=AEeEFBR5mlDLCJWXOP7kfTzdUd3H5HvZ3SY2XmzLXz/csbAISLD7Vi750S0gqGwmQL
	6DRmmKV+mEwtWME04h0GIypNG8V4Bph9iV3kncujmf8w36LOOrtlKGs1shjY+anad3Y+
	iT2P1sb3uqFn/IbLx7kNIJPZxUI9R49oKyK07w2ky1Xvs9ix1sMwzW19y4v6Fa5FC76c
	f3eXU1FbEAvi6ODswNoKMr/mDLKx1ZyCSwXklxv8qjBk8wGVXDlEXRXAgmxfcP3T7rKN
	QKGxpStyicmxX/UTzChfNI64Wp5CqwJOcpvkyf/fp1MsDlSCzufpd1AiovgHVvtdBhL0
	q6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=aO/FhLVXOr8zDRSpWOR6pQFj3ORHtEzn7+OJ2jq+YKY=;
	b=qpADskHxtcwM8LXRfYm97/GZdb9CWYoKU135MDJ1+DAAuXnvrg55bvA34zvNr0PM3w
	0O20K8E3I/pf4DbJhryCl7Ujf2Fae886Qdx5HxTrz8wJvqhi6BYcwEAkjjRArs6X4wTg
	QwXZRAWRHlMlfYE9hQ4hRbhwiVQs6C4/D7Ek9DHV9srhinVUaf2i/3TS4J5eHGnIyyIC
	w75J9p6HgAd4cX36vlMUXJzdO+Ax3e7KCc96Bjn0v5SqmCNcqWnWIRndGkeyGOVCQUNT
	44JDbGupiaq4qjiaAPlB/5BZFVaekeFRQWrLDWPX0TxS6tqfyOSTkrL8cU3wiyGkdkuN
	30tg==
X-Gm-Message-State: AHYfb5gEAGTlNmysp7A3P8s0KIWYgZjg/UmxGNNaS6Xvybld717qVtgE
	6mR9uYRI89ixFsf1mpABO7TDimSk/U19IUM=
X-Received: by 10.176.23.149 with SMTP id r21mr2080809uaf.192.1502919943265;
	Wed, 16 Aug 2017 14:45:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.1.213 with HTTP; Wed, 16 Aug 2017 14:45:02 -0700 (PDT)
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Wed, 16 Aug 2017 16:45:02 -0500
Message-ID: <CAJgxT3_abFJom8rGYkavgwL7w2nYLBT7vdV3MK5O6LS0Y2tRbg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Pull request for 'qtbase: fix Krogoth build regression'
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
X-List-Received-Date: Wed, 16 Aug 2017 21:45:42 -0000
Content-Type: text/plain; charset="UTF-8"

https://github.com/meta-qt5/meta-qt5/pull/62

