Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <attrezzopox@gmail.com>) id 1Py357-0003q3-D9
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 15:12:52 +0100
Received: by iyb26 with SMTP id 26so2795719iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 06:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:message-id:in-reply-to:subject
	:mime-version:content-type;
	bh=TdazzVxIUZEfx3PNrEw8jXDBXLBq5EMzeaQOqN0xTJQ=;
	b=j0MnlEx142a3fA8pyQLL+6MKa/IbEdHCrT02K66yWMbkERwkpa4Zoql9hjS+w8R+Rr
	YI1ROUzMjQVUn3dRVlmZpA3a6zXhA09MZgt4kpKmE9j7gEMB30ndL+S+mG+lf6esXH1b
	h4aahJGUvpwKU8X3LfyR9ldnjA9GEOb2DSVxQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:message-id:in-reply-to:subject:mime-version
	:content-type;
	b=Do9dEbbCUpBZtgoNDRBIC0FJgvNNMN4qL2swZzQ0l1XyDCfD0oUi3esYI4WFdVH3fu
	xFnxH2c8g8UV1il7jU0v9ZAcZYgsh2BR39IgPw8WZiOdJkKyU4uFMttfNa57N8mcdYSH
	wiSx7JSYr1gLtjPPy2DCcxo5pQNcri2R9VD1A=
Received: by 10.43.45.135 with SMTP id uk7mr150425icb.301.1299852653171;
	Fri, 11 Mar 2011 06:10:53 -0800 (PST)
Received: from localhost (dmze.pantherenergy.us [209.12.107.35])
	by mx.google.com with ESMTPS id wt14sm3156480icb.4.2011.03.11.06.10.51
	(version=SSLv3 cipher=OTHER); Fri, 11 Mar 2011 06:10:51 -0800 (PST)
Date: Fri, 11 Mar 2011 08:12:11 -0600 (CST)
From: Marcus Gaskamp <attrezzopox@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <3921414.74.1299852728608.JavaMail.marcusg@IT-marcusg-desktop>
In-Reply-To: <25548103.69.1299852642806.JavaMail.marcusg@IT-marcusg-desktop>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: EOL in string?
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
X-List-Received-Date: Fri, 11 Mar 2011 14:12:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


bitbake helloworld 
NOTE: Out of date cache found, rebuilding... 
ERROR: Error evaluating '${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}', 'BASE_PACKAGE_ARCH')}' | ETA: --:--:-- 
Traceback (most recent call last): 
File "/home/marcusg/stuff/bitbake/lib/bb/data_smart.py", line 117, in expandWithRefs 
s = __expand_python_regexp__.sub(varparse.python_sub, s) 
File "/home/marcusg/stuff/bitbake/lib/bb/data_smart.py", line 69, in python_sub 
codeobj = compile(code.strip(), self.varname or "<expansion>", "eval") 
File "MACHINE_ARCH", line 1 
oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE 
^ 
SyntaxError: EOL while scanning string literal 

ERROR: Error parsing /home/marcusg/stuff/openembedded/recipes/perl/libhttp-cache-transparent-perl_1.0.bb: EOL while scanning string literal (MACHINE_ARCH, line 1) 
ERROR: Command execution failed: Exited with 1 


Was installed according to Chumby instructions http://wiki.chumby.com/mediawiki/index.php/Building_OpenEmbedded_(Beta)#Building_with_OpenEmbedded . Openembedded is pulled via git and bitbake is installed in a home directory and added to path. 



