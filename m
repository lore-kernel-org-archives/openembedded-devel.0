Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id A7F386E7DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:10:33 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k4so2309959qaq.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=yoluXwQCq+CgenD/Ze7BxDEPv+mKS37r06Maee+lAy4=;
	b=Y5Bkg7lcyFE+MwLcyc08WEmGvJbmlP4gMnoF8eHABMvU1iIaxeqBi09x4l+fl+NViK
	m4UVgqav6YfmmSjoByQe6QCtSyf42j2SiG+wUlxbz/cxckuwJnfjfHCLFQxa47fzInOH
	VeW2JcLloMX7KRdEYzIGuGqA3meFzRF1N1IRun2ocQ3AIGaZInmgYWo8pQH0y3mnbUbL
	Dush7KvQxIFzIxAlteQjalQPm0Mb6XHQwP7zjMMPr9Ro32xGZMWo+E7KhPWdgMibNnL0
	NDvI1H1V97MQ7kuVNxL4N886BJjeDhx6rVFcbzV9N4bUmp0M8snayM3Raggbha9bRYsm
	g52Q==
X-Received: by 10.140.106.225 with SMTP id e88mr10575142qgf.66.1390997434127; 
	Wed, 29 Jan 2014 04:10:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Wed, 29 Jan 2014 04:10:14 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 29 Jan 2014 10:10:14 -0200
Message-ID: <CAMCfZKEwQWimV0j8FE1Z1KVW=xUCZgR36_Li1fNuiZfwYm7yrA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Systemd journald (206) storage issue
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
X-List-Received-Date: Wed, 29 Jan 2014 12:10:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Folks,

It seems that journald version 206 has an issue with storage. It is not
respecting the configuration and my storage is getting full after sometime.

Here is my journald.conf:

[Journal]
#Storage=auto
#Compress=yes
#Seal=yes
#SplitMode=login
#SyncIntervalSec=5m
#RateLimitInterval=30s
#RateLimitBurst=1000
SystemMaxUse=32M
#SystemKeepFree=
SystemMaxFileSize=4M
#RuntimeMaxUse=
#RuntimeKeepFree=
#RuntimeMaxFileSize=
#MaxRetentionSec=
#MaxFileSec=1month
#ForwardToSyslog=yes
#ForwardToKMsg=no
#ForwardToConsole=no
#TTYPath=/dev/console
#MaxLevelStore=debug
#MaxLevelSyslog=debug
#MaxLevelKMsg=notice
#MaxLevelConsole=info


I'd tested journald version 208 with the same config and it worked.

I'm using dora branch.

Any thoughts?


Regards,

--
*dS
Diego Sueiro

/*long live rock 'n roll*/

