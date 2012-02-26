Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rolandu@gmail.com>) id 1S1hqT-0008Gg-Pq
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 18:25:14 +0100
Received: by lahc1 with SMTP id c1so4698417lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 09:16:48 -0800 (PST)
Received-SPF: pass (google.com: domain of rolandu@gmail.com designates
	10.112.102.37 as permitted sender) client-ip=10.112.102.37; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of rolandu@gmail.com
	designates 10.112.102.37 as permitted sender)
	smtp.mail=rolandu@gmail.com;
	dkim=pass header.i=rolandu@gmail.com
Received: from mr.google.com ([10.112.102.37])
	by 10.112.102.37 with SMTP id fl5mr4133595lbb.95.1330276608712
	(num_hops = 1); Sun, 26 Feb 2012 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=SFW9oKIz0dDEax1X22lz1puYK8UpqFtZhQQP6kG0Y3U=;
	b=lOfNRRq59fyqYjeJGFQWP2Eg6952njdcPvGeK5azGUtU3wALrLVfiTU0+qplM4f4jJ
	a9aExCAvwOErCPE95MBCaOx54U9Ox940Eqvezl1MwIcyV8qlCcNN71HrKEDOVrwOHawA
	HrztsgzKj+k3DVgTSK4bVpkbcM5GJwnj8X5X0=
Received: by 10.112.102.37 with SMTP id fl5mr3502188lbb.95.1330276608521;
	Sun, 26 Feb 2012 09:16:48 -0800 (PST)
Received: from [192.168.1.50] (89-235-208-74.saturn.infonet.ee.
	[89.235.208.74])
	by mx.google.com with ESMTPS id k4sm14416318lbw.10.2012.02.26.09.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 09:16:47 -0800 (PST)
Message-ID: <4F4A68FE.2020109@gmail.com>
Date: Sun, 26 Feb 2012 19:16:46 +0200
From: Roland <rolandu@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: angstrom site down, where to find mirrors
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
X-List-Received-Date: Sun, 26 Feb 2012 17:25:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

It looks like my first experiments with openembedded started at a bad time.

angstrom distribution's website is down, so some files which are needed 
to build anything are gone.

I'm trying to create the crosscompiler, but running 
recipes/gnu-config/gnu-config_git.bb, do_fetch is impossible since 
angstrom website is down, and none of the mirrors work.

So my question is:

where can I find mirrors for this file, and how do I add the mirrors to 
the build system.

Thanks for any advise You can give me,
Roland




---- ERROR LOG

NOTE: Running task 2 of 19 (ID: 8, 
/media/ssd-data/roland/workdir/OE/openembedde
d/recipes/gnu-config/gnu-config_git.bb, do_fetch)
--2012-02-26 18:11:30-- 
http://www.angstrom-distribution.org/unstable/sources/g
it_git.savannah.gnu.org.config.git_e35217687ee5f39b428119fe31c7e954f6de64f0.tar.
gz
NOTE: package 
gnu-config-git-r1+gitre35217687ee5f39b428119fe31c7e954f6de64f0: ta
sk do_fetch: Started
  Resolving www.angstrom-distribution.org... 140.211.169.179
  Connecting to www.angstrom-distribution.org|140.211.169.179|:80... 
connected.
  HTTP request sent, awaiting response... 404 Not Found
  2012-02-26 18:11:31 ERROR 404: Not Found.

  --2012-02-26 18:11:31-- 
http://mirrors.openembedded.org/git_git.savannah.gnu.o
rg.config.git_e35217687ee5f39b428119fe31c7e954f6de64f0.tar.gz
  Resolving mirrors.openembedded.org... 82.197.159.157
  Connecting to mirrors.openembedded.org|82.197.159.157|:80... failed: 
No route t
o host.
  --2012-02-26 18:11:33-- 
http://sources.openembedded.org/git_git.savannah.gnu.o
rg.config.git_e35217687ee5f39b428119fe31c7e954f6de64f0.tar.gz
  Resolving sources.openembedded.org... 140.211.169.152
  Connecting to sources.openembedded.org|140.211.169.152|:80... connected.
  HTTP request sent, awaiting response... 404 Not Found
  2012-02-26 18:11:34 ERROR 404: Not Found.



