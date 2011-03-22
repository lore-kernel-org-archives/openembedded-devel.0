Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q23HR-00032x-VG
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:13:58 +0100
Received: by ywg8 with SMTP id 8so2904043ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:subject:date:message-id:x-mailer; 
	bh=ITRG6rGqoxW3FUtw1RkdWdspLb7lTxoumPYLBfG1PBY=;
	b=KthMYEvJQnA5DyAvEE8t6cCegXptOzxQgn5c7KI6gSGi+EQb5K0O1ypbKqoQFDUrnL
	O3OL1v3Mi1HkVe4pnvBydTp/mFxWFrBQWFHlV4G7mZbyHLzVhNHOcv6sB815ph5hgXcn
	4qjgbaxq4Ug1Ba1fyKnYnXmyWOkyS2qjPxX4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=St1t6AIJQIz4uLu/anM5gHDjBPirfID8EOYjiCp6vZFvdWfIQwI7v5nWOfKRSq257W
	3uuEokPyueWP7TOKpF/ezSZETkor2lG7o1VqiHVYfQYM6WZFOZJd1WcmxlgZBntVow58
	0VcsVDGnQ6+404AJvVXBMTGV6n3gEaxX6yUy8=
Received: by 10.151.62.14 with SMTP id p14mr5309974ybk.30.1300806725510;
	Tue, 22 Mar 2011 08:12:05 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o2sm1732487ybn.21.2011.03.22.08.12.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 08:12:04 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:11:19 +0000
Message-Id: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 0/4] Patchset being use on O.S. Systems tree
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
X-List-Received-Date: Tue, 22 Mar 2011 15:13:58 -0000

Hello,

Here goes our current patchset that is being use on our tree. Besides
this, there's also the udev change that is still open and unsolved.

[PATCH 1/4] wrapper/install: add -t support
[PATCH 2/4] flash-plugin: update to 10.2.153.1
[PATCH 3/4] vlc: use INC_PR
[PATCH 4/4] vlc (1.1.4.1): depends on lua5.1

With following diffstat:

 bin/install                                    |    4 +-                                             
 recipes/adobe-flash/flash-plugin_10.0.22.87.bb |   35 --------------------
 recipes/adobe-flash/flash-plugin_10.2.153.1.bb |   41 ++++++++++++++++++++++++
 recipes/vlc/vlc.inc                            |    2 +
 recipes/vlc/vlc_0.9.2.bb                       |    2 +-
 recipes/vlc/vlc_0.9.6.bb                       |    2 +-
 recipes/vlc/vlc_0.9.8a.bb                      |    2 +-
 recipes/vlc/vlc_1.0.6.bb                       |    2 +-
 recipes/vlc/vlc_1.1.4.1.bb                     |    4 ++-
 9 files changed, 52 insertions(+), 42 deletions(-)

Cheers,



