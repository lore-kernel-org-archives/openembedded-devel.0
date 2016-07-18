Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id D4B2860797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 22:01:59 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id q83so3297994iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=Z+TJCFqaR95UsvUyYVTdwFZWEXL1mWQ4hZPJyAZjkNA=;
	b=vlK/vMQQuhbq+7+4c1eqlq1eYSU8lD/wHRxDDeheBQizhsQ0TlgZyEw7YE/o/I1W1H
	C7rSy66ceWv7rh6baLIrBEHCkTp5gq+qmRPydAmVq3dqqVTIm2oxeQw4trfFSZStnH6q
	ADYlXUisiBblkKOfqGm2CXwu6v/ZMh+3w9OD4I3SO0/oPTE9t9uU2lFts3WmReQ7Pg2k
	NcD298Y3U8+N43TLm8wO9/ENuuE4aPE+LXwFPIgJkRQUCUHO0GcMr9P7SShg5oBvdOTa
	MHGNDVe+qjzvMdw2W1x6iVR22kRYh8pUckXqIeVZi/OWLayOMVIlLInW2GaXw2ZvfA3R
	4qTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=Z+TJCFqaR95UsvUyYVTdwFZWEXL1mWQ4hZPJyAZjkNA=;
	b=ZcNxMJHYZLzvknlScVfmFHxpkb6g6NxD2SP41CdRzCxPNTLS3WFTmzE2ptMYn25+cF
	swpdDoB4RayP9HOwmZCo/2lSO+jcIKk46fnnAhPs75OzroczPAPTBikZfsOjqPAFtftG
	JuOcrszgwPrkV22+ccyZNTR0ncBJ7nhpKDhBjN1u+V1tItVE2Bl8t2GTz2+0Sa+NPi+V
	TagNp8NPv0s/OZ6MCisdLgI3GR67SYZfSEPEy3gZPxG0J0mwazzGQJiwZZgA9Z104+Z+
	MPeBK+pPh1OR2xk7BOlKzGkN37jtsMiJoWs2hvwQDKGvxO8bRHoSu9yxIgHf1MlF9fG+
	AvKQ==
X-Gm-Message-State: ALyK8tJ6Iy2kJhqsEDMUPd/RjwDZ2t6TAAEAiyeVZyKhsPEK4SRCs2psSMMtluNOPPfp5L8+QSOq+cTCVT1YLfcP
X-Received: by 10.107.154.196 with SMTP id c187mr6905415ioe.99.1468879320048; 
	Mon, 18 Jul 2016 15:02:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 15:01:40 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 23:01:40 +0100
Message-ID: <CAJTo0LYNjoPfahXjaKEVP6ey=mY3MKDKK5DoCPB9Dp151UgFpw@mail.gmail.com>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Removal of uclibc from oe-core?
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
X-List-Received-Date: Mon, 18 Jul 2016 22:02:00 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Now that musl is fairly mature I think it's time to take uclibc out to
pasture, where the pasture is possibly called meta-uclibc.

Carrying excessive numbers of C libraries in OE Core isn't really ideal,
and musl approximates the size of uclibc whilst being far more feature
complete.  I have a patch to remove the uclibc recipes from OE Core whilst
keeping the infrastructure so a meta-uclibc would be possible if someone is
interested in keeping in alive going forward.  Is anyone interested in
creating and maintaining a meta-uclibc?  Is anyone horrified at the
prospect of uclibc being removed from oe-core?

Feedback welcome!

Ross

