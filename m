Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1826C786D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 14:50:35 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id d205so5134251ywe.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2Jt3J91yK0239KvObD9xIaWSBhSC3gyTS6QvY72G6s4=;
	b=YStqimvAszY+HWzxZYHm2JsRtDVsuPy1CVN7/VwH6AyFnT9ZMx4lR20EzxBIIA5Zv3
	JMbCRylVR0aqZRt4E7AegKH7yFcMfMDypCMIxyoCQziljtqAz1BlOrykSZcibEoLHDnw
	b9uc44VnZTVBKMjtbzeM1nyi+11Q7hB1heewFVfYnyqtWe9X5SoPnZ37ZUNInSJQA+RZ
	59qQL208dp9nNaQlESHuDYcAHcnk8Y9lXND+C3uEuQkVpMzLh3g3y71GtBGnZpNM5bsP
	IxUMLLZ1W5mxwFZGwJhXvXO7dmJzVZB6KKlI7T30BHBobMbpvxvSdpvDkyopndXsBfrP
	Zd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2Jt3J91yK0239KvObD9xIaWSBhSC3gyTS6QvY72G6s4=;
	b=Cp3ZJmYik8q0DnbCOPuktWBoTrCgCtN3+VYOcg2fhm9njDPFOkXkTZU5o8Pj1FeZ33
	IbxPNM8a8kXXfIeY41/4zo1sLVh+Y6KNpZOXk7CdCKQrIZfzy/kvarCrqwV7/hxQ7jkx
	gc4RKFJmprgLfJV2VnJSkmOOHAQVlPBY+JuDpfMoruWqeIOijd+R7yDK0SJE+Bzg1QpC
	nCx6WpITcOlCJloyPx3FvHPkuSlECUN10IZbsbx//pkLOt4L9+N3chxwQ0AZOxE2VflR
	xkH+rEgCGVwUaeSzgr5kOcrANIE/9qYPHcLM7/q0FQ2IGqS0Ks6MxLSkWyAVIrXqTYok
	sVVA==
X-Gm-Message-State: APf1xPB7qP9veQFPZmfqQGYYxHELLqe76oKs6kQI6fwZ/i5RDlQqWMTE
	3TvkK1pbfq25Th6KRMH8YkBobf6H6PpQ85X7tDQ=
X-Google-Smtp-Source: AG47ELswNKFG5AXr3s5KaBywUlj9ELzHZtGsftRokKeeE8HuCXl0ZjbtgSgRNP6BlOPztpkTrck5A2HY5k46hZo513E=
X-Received: by 10.129.178.199 with SMTP id q190mr3997346ywh.272.1519656636779; 
	Mon, 26 Feb 2018 06:50:36 -0800 (PST)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 26 Feb 2018 14:50:26 +0000
Message-ID: <CAFeBWL4LZ=xd=eEn=+B+MUziFNBuaczJU1gGk0-rqXHPWW7D-g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Problem with /default-qt/tooldir
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
X-List-Received-Date: Mon, 26 Feb 2018 14:50:36 -0000
Content-Type: text/plain; charset="UTF-8"

Building on git #db881bb4917628ad, my images are showing these errors:

# qmake
qmake: could not exec '/default-qt/tooldir/qmake': No such file or directory

# qmlviewer
qmlviewer: could not exec '/default-qt/tooldir/qmlviewer': No such file or
directory

Has anyone else seen this lately?

BR,

Adam

