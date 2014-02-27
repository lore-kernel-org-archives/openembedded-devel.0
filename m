Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 58C906F273
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 16:36:18 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so3069194wgg.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 08:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mvwXhTZ0YrhM9JFyBQ+SSHWOonx4mn8AEeiy2TFiseg=;
	b=X1gGRJ+e8Ok5ZD9kNODB5fNjCXb9OmDV3vcdR8ailUu1pJ9xeCU1IKAkIn1Lcfbx8r
	r4W1pjiFcpByyS0+L5HeCQcvu2Dkt0QpEKkYX9X+q06cKIDsGe4WQcHBLj5lZEdXMo6B
	W737w+mfwjTrt6aNL9T+6f2bmb/vbrNDA5xcc4kbQkZtpu1rna5FjQNxZtuyiEmXTSiq
	OfgfG6UGiUkV27QCoNUCeiqOyP4OYtT7fNkcPcr0YfbQq4H7RjTrP11wUAM8IHsp44UV
	lgmZY+vJoXemoZ8UAGG6PW+67JuIi0z800CVy9TlEcpSeymq3LQO2Sn52zyYV/NKZnJq
	OmNQ==
X-Gm-Message-State: ALoCoQnU5kT0vn5rs+pwpSOROlnzLNZkzNO698uarMozjtOHbTCAw12Ulb+sctwKHmVS+DRJxOpk
X-Received: by 10.194.77.7 with SMTP id o7mr8737147wjw.35.1393518979580;
	Thu, 27 Feb 2014 08:36:19 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id 12sm12452107wjm.10.2014.02.27.08.36.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 08:36:18 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 17:35:51 +0100
Message-Id: <1393518954-15100-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora 0/3] A couple of backport for dora
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
X-List-Received-Date: Thu, 27 Feb 2014 16:36:20 -0000

Hi Martin,

the following commits were recently merged in master branch. I have
rebased/backported on dora and tested on ARM board. Only 1 minor had
to be resolved. Can you please merge them in dora branch?

thanks

nico


Andre McCurdy (3):
  qtbase.inc: don't force ARM_INSTRUCTION_SET to arm
  qtbase: configure with -openssl-linked instead of -openssl
  qtwebkit-examples: add RDEPENDS for ca-certificates

 recipes-qt/qt5/qt5.inc               |  2 ++
 recipes-qt/qt5/qtbase.inc            | 10 +++++-----
 recipes-qt/qt5/qtwebkit-examples.inc |  1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
1.9.0


