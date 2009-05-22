Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M7UPV-00042S-8Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 15:03:42 +0200
Received: by fxm20 with SMTP id 20so1678793fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 May 2009 05:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=PRx916vHjetSh4WYEP2GiW5v8Z4+0r/xpnsuHCAtm1w=;
	b=jgU2agy5ydR1wrfIoBZmSaQUFIhfRUVP6AKaAdAn4Nh//Nti6wMuYhKjVPnejXCN8b
	C0GRePFaPSuIPcoYoLVez7/4w0AAHWB1UU0nzPzzSC7pX6sXiUvZx8CRwLSbks1WeJBd
	ZlCrCZQlNBFDlzwpIoJ0TgiyL2aKx8jM6/E/Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=bKy0it1diNrnqgCLt2jq2rzzYPG0sMcDErSvLrA8UhGoT4H3Qd/IkY/N0LrwAu2O2Q
	GoqSOuhUfnRiM0IwQu8fzvATCSt6LHdYcAz1fjecAuspeW4gkUKr1KwmHs9b8xxzX0a5
	nRGaw7xQegmPksQHLvYb/ZdIBMA47yiZDp14g=
MIME-Version: 1.0
Received: by 10.103.52.2 with SMTP id e2mr952628muk.33.1242996958141; Fri, 22 
	May 2009 05:55:58 -0700 (PDT)
Date: Fri, 22 May 2009 15:55:58 +0300
Message-ID: <fce2a370905220555o3d234765y6fbeadb0c41629d3@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org, koen@openembedded.org
Subject: New hal is not buildable (needs new blkid version)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2009 13:03:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello!

After Koen committed new hal (0.5.12) to .dev branch it becomes
unbuildable. The reason is that this new version depends on new blkid
library (version >=1.43) but there is no e2fsprogs-libs-1.43* in the
tree. The problem is that the new hal was also set as preferred for
angstrom distro. Please either add new e2fsprogs-libs or set
hal-0.5.11 as preferred.

Thanks.


