Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SCwLa-0006xL-Ik
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 19:07:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6A0F8315A95A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 18:58:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UOwmFBqO8L1i
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 18:58:35 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ec5f8.pool.mediaWays.net
	[89.14.197.248])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 5A0EF315A7C7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 18:58:35 +0200 (CEST)
Message-ID: <4F73433A.3030405@opendreambox.org>
Date: Wed, 28 Mar 2012 18:58:34 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: perl warning on git connection via ssh
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
X-List-Received-Date: Wed, 28 Mar 2012 17:07:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Dear admins,

whenever I connect to git.openembedded.org via ssh, I see the following
warnings:

perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
	LANGUAGE = (unset),
	LC_ALL = (unset),
	LC_MESSAGES = "en_US.UTF-8",
	LANG = "de_DE.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").

You should be able to force the system default by removing "AcceptEnv
LANG LC_*" from sshd_config or by setting the four variables mentioned
above to "C" in the git user's profile.

Regards,
Andreas



