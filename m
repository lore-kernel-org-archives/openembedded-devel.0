Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RlFHp-0002Ve-D7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 08:41:25 +0100
Received: by vbip1 with SMTP id p1so116304vbi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2012 23:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=kn4zP9h9JxTQZk2YhSigJeVpRXV7gnhgAtXGPiHhAcs=;
	b=FcA3EYoCUeRjxIZL9Gwo9Gz82sjPi8LNMuknLNUIGKZbtH2PIVo5gcmiJi/oJtpqbh
	71fGGxcy+9gz3XEx0+0JTFL3flWK7I/vdxuFlkt017Aht+3t3MMRp4XcPMt9W/It5H46
	06jajECnHTaTauVjmnAFjCma52P0raGIAPhW8=
MIME-Version: 1.0
Received: by 10.52.21.196 with SMTP id x4mr1208804vde.20.1326353634260; Wed,
	11 Jan 2012 23:33:54 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Wed, 11 Jan 2012 23:33:54 -0800 (PST)
Date: Thu, 12 Jan 2012 08:33:54 +0100
Message-ID: <CACW_hTaxUWYmPmvczsBFNgaGBKMFyt7Pg40ZCr6JNppe3btScA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	trini@kernel.crashing.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [2011.03-maintenance] commit 89cb863234616620d172984ff173f1d84ce4caa9
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
X-List-Received-Date: Thu, 12 Jan 2012 07:41:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I just accidently committed
89cb863234616620d172984ff173f1d84ce4caa9<http://cgit.openembedded.org/openembedded/commit/?h=2011.03-maintenance&id=89cb863234616620d172984ff173f1d84ce4caa9>on
the maintenance branch.

My intention was to commit this to master and send a maintenance pull
request, but as i did not notice that my branch was on 2011.03-maintenance,
I accidently pushed to that branch
(actually somewhat surprizing me, as i did not expect to be able to push
against that branch).

I'll leave it to the maintainers to decide on how to handle this.
I would like to see this recipe in the maintenance branch too thoguh.

The patch moves the recipe from the 2007_365 version to the 2010_365
version.
commit message:

    ntpclient: updated to 2010_365 version

    Changes since ntpclient_2007_365:
    -- fixed type of sa_xmit_len, thanks vapier
    -- dropped underscores in spelling of adjtimex(2), might make uClibc
happier
    -- include netdb.h and always define _BSD_SOURCE to get prototype for
herror
    -- minor formatting to align with Nilsson's fork
    -- add -fno-strict-aliasing as needed by traditional network coding
style

    The 2nd -- also implies our local patch is not needed any more

Apologies for any inconvenience.
Frans

