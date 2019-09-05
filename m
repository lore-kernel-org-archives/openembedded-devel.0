Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E71EA7F29A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 22:38:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x85McfDF010236
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Sep 2019 15:38:43 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Sep 2019 15:38:41 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Sep 2019 06:38:37 +0800
Message-ID: <20190905223839.33419-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-webserver/oe][Patch 0/2] Redefine libexecdir to fix apache2
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
X-List-Received-Date: Thu, 05 Sep 2019 22:38:42 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Build with
1 echo 'IMAGE_INSTALL_append = " apache2"' >>conf/local.conf
2 bitbake core-image-sato-sdk
3 runqemu qemumips64 nographic 


root@qemumips64:~# systemctl status apache2
* apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2019-09-05 22:29:59 UTC; 45s ago
 Main PID: 178 (httpd)
    Tasks: 82 (limit: 546)
   Memory: 7.0M
   CGroup: /system.slice/apache2.service
           |-178 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start
           |-192 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start
           |-193 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start
           `-194 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start

Sep 05 22:29:59 qemumips64 systemd[1]: Started The Apache HTTP Server.
root@qemumips64:~# systemctl stop apache2
root@qemumips64:~# systemctl status apache2
* apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
   Active: inactive (dead) since Thu 2019-09-05 22:30:56 UTC; 4s ago
  Process: 178 ExecStart=/usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start (code=exited, status=0/SUCCESS)
  Process: 341 ExecStop=/bin/kill -WINCH ${MAINPID} (code=exited, status=0/SUCCESS)
 Main PID: 178 (code=exited, status=0/SUCCESS)

Sep 05 22:29:59 qemumips64 systemd[1]: Started The Apache HTTP Server.
Sep 05 22:30:51 qemumips64 systemd[1]: Stopping The Apache HTTP Server...
Sep 05 22:30:56 qemumips64 systemd[1]: apache2.service: Succeeded.
Sep 05 22:30:56 qemumips64 systemd[1]: Stopped The Apache HTTP Server.
root@qemumips64:~# systemctl start apache2
root@qemumips64:~# systemctl status apache2
* apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2019-09-05 22:31:15 UTC; 2s ago
 Main PID: 348 (httpd)
    Tasks: 82 (limit: 546)
   Memory: 5.2M
   CGroup: /system.slice/apache2.service
           |-348 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start
           |-349 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start
           |-350 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start
           `-351 /usr/sbin/httpd -DFOREGROUND -D SSL -D PHP5 -k start

root@qemumips64:~# curl localhost
<html><body><h1>It works!</h1></body></html>




Kai Kang (2):
  apache2: fix multilib file conflicts
  php: sync with apache2's change

 meta-oe/recipes-devtools/php/php.inc                   | 6 ++----
 meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb | 6 +++---
 2 files changed, 5 insertions(+), 7 deletions(-)

-- 
2.17.1


