Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 626456E8DE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 21:24:03 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id db12so13812057veb.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=h5X4gtO8AyLKja+JzRvfRZKAlJhQG24Wczu2EKf3YjM=;
	b=fMeKH3IGpHepC70IEKGywM06pDS9SbzM4JHaAB94ec6zgSIL3t5dCadGZ5oANKi6Ya
	nb207NqEtSW3vsOSQA/lK/yFwXHcEf4bRH3quptcCBYVdOFEWDsRoPqdQ+2lEYtvI5uE
	IOLJYsTb5i5zXJN0nfbD3gA4g8mvrt5MzBtZQK/GWO5WTGDxxu5YkiPLuBkz8PWdZkoN
	KuycFhMBkZJ5Hg+oEawfNsVdmOdkiZVHHeeTf+FseJp3GGxOA+wULCUm47Pz8R7nkON4
	LrdKBLBzZIlkXy/FRbl0lP/dpTYjsf4O1ChNZPvhpH2mVfDZnmmjp7ldOe6Ozb5euRav
	xpgg==
MIME-Version: 1.0
X-Received: by 10.52.68.106 with SMTP id v10mr1751197vdt.59.1392758643931;
	Tue, 18 Feb 2014 13:24:03 -0800 (PST)
Received: by 10.52.169.99 with HTTP; Tue, 18 Feb 2014 13:24:03 -0800 (PST)
Date: Tue, 18 Feb 2014 13:24:03 -0800
Message-ID: <CAFeBWL6zsCSF2Op72zvnaZ=XmHQkXUcH8we=vFDrVo--wb6bdw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: GDM alternative?
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
X-List-Received-Date: Tue, 18 Feb 2014 21:24:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello everyone, I am sure this has been asked before but I haven't found a
solution.

I am currently integrating GDM to my XFCE image. I was hoping that it's as
easy as adding GDM as the graphical init manager (in local.conf), but it
looks like PolicyKit, Console Kit, PAM, gconf, gconf-sanity (as per
meta-angstrom) all need to be correctly configured for GDM to work. This
integration of multiple frameworks is not what I had in mind. So I am now
searching for alternative - something more lightweight and with less
dependency.

meta-oe contains another login manager 'slim', except it's no longer
maintained and has been moved to nonworking directory within the tree. I
don't see any other.

Thank you,

Adam

