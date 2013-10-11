Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEE96D033
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 14:01:02 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 15:00:52 +0100
Message-Id: <1381500055-11483-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCHv2 0/3] rsyslog: update to 7.4.4
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
X-List-Received-Date: Fri, 11 Oct 2013 14:01:03 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

update rsyslog to the latest version and add required dependancies.

v2: add signed-off-by

Jack Mitchell (3):
  json-c: add 0.11
  libestr: add 0.1.6
  rsyslog: update to 7.4.4

 .../recipes-extended/rsyslog/rsyslog/rsyslog.conf  | 60 ----------------------
 meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb  |  5 --
 .../rsyslog/{rsyslog.inc => rsyslog_7.4.4.bb}      | 24 ++++++---
 meta-oe/recipes-support/json-c/json-c_0.11.bb      | 11 ++++
 meta-oe/recipes-support/libestr/libestr_0.1.6.bb   | 11 ++++
 5 files changed, 38 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bb
 rename meta-oe/recipes-extended/rsyslog/{rsyslog.inc => rsyslog_7.4.4.bb} (54%)
 create mode 100644 meta-oe/recipes-support/json-c/json-c_0.11.bb
 create mode 100644 meta-oe/recipes-support/libestr/libestr_0.1.6.bb

-- 
1.8.4


