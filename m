Received: from [209.85.221.178] (helo=mail-qy0-f178.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <wjjeon@gmail.com>) id 1N6HdL-0005UH-0l
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 06:45:18 +0100
Received: by qyk8 with SMTP id 8so350873qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 21:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=h8d2mF+ls1h4pHjToj6xpo0JjfpaJw5LLvMc/auQYcM=;
	b=MF9bE589gwJp2KBS/bZ6ivrmG0aClPZy44Jaoqx+2L2yx8hFt4v4GBXaYFPnxA9GYL
	eIwOVr+pBF4aphckuSxNfspfpW9jQzzXqE8YiavoHnvPZDQI3TQdUzk3il3nc4dJWVah
	uvhqzGxJQJP16A+wqanRv1iVft634iKDNV0IE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=fhvM/DknpzCMvqeO9CTwmDjchT522f6F/HAwe+BJNPsbZyAP62jcwXy2WBm2tEMHnt
	X/fx+cXxKhTKvTf1A+09lNlH2a8n906uyd+wGnPfIzEz0Zx30YtvCr8v7sxlLn0K7VIk
	28YAIVKXx5jnjhOr4402f51miBZvqhKb2e14I=
MIME-Version: 1.0
Received: by 10.224.36.89 with SMTP id s25mr2141150qad.5.1257485872832; Thu, 
	05 Nov 2009 21:37:52 -0800 (PST)
Date: Thu, 5 Nov 2009 23:37:52 -0600
Message-ID: <b8b15f5e0911052137i83348d4rc21cd418d32c1665@mail.gmail.com>
From: Won J Jeon <wjjeon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: wjjeon@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: First compilation issues
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
X-List-Received-Date: Fri, 06 Nov 2009 05:45:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

I successfully compiled Angstrom Linux with OE and now I am trying to learn
how to use OE on my Ubuntu 9.04. While I was following the simple
instruction to compile 'myhelloworld' in the manual, I have the following
error messages:

$ bitbake -b recipes/myhelloworld/myhelloworld_0.1.bb
/var/lib/python-support/python2.6/bb/COW.py:29: DeprecationWarning: the sets
module is deprecated
  import types, sets
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 19 (ID: 1, /OE/openembedded/recipes/myhelloworld/
myhelloworld_0.1.bb, do_setscene)
ERROR: function staging_helper failed
ERROR: see log in
${OETREE}/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/myhelloworld-0.1-r0/temp/log.staging_helper.9492
NOTE: Task failed:
${OETREE}/angstrom-dev/work/armv5te-angstrom-linux-gnueabi/myhelloworld-0.1-r0/temp/log.staging_helper.9492
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/OE/openembedded/recipes/myhelloworld/myhelloworld_0.1.bbdo_setscene
failed
ERROR: Task 1 (/OE/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb,
do_setscene) failed
NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun
and 1 failed.
ERROR: '/OE/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb' failed

Can you let me know these errors occur? Thanks in advance.

