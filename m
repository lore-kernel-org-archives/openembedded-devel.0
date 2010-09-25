Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzYSQ-0007QH-4g
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 19:23:10 +0200
Received: by iwn2 with SMTP id 2so1547482iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=dVXCL7d0mpb3VNLQYW374BvqSl6fZ9tu4U2On6pMrZQ=;
	b=cD/XDvZqLyM7BqmU+kvl1cMM0K6n4VKi8em/sEvjiVHGUNbFtBmbuJM23nP9CDhSrb
	RCQmbS1W9ECMlzjIl1Ct8jM8YXssfZZ2gX1PnsLgQdKVvqQ7JJ/rOVPkTRmhVgNHBMHp
	T4S7e3dwoS0ES2SJonlRmobX90YiwWOrbzBFs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=tKgnaSmoQXhjdQvhZ7jU/J6oeDqw+HTVDvxXyXEtfxG0EJylXFEHWUXkJeGiQNDwsI
	b2KldcwGD5Ky7UcO4gzwq1i4nITc8l4mfhhytYxK5vEspe82JzOlnBxUapOcPpMR8DP7
	RiTo0miKhSNYAVtSmtCWnTgxoJi0ki+qum+fU=
MIME-Version: 1.0
Received: by 10.231.33.73 with SMTP id g9mr5659318ibd.117.1285435346293; Sat,
	25 Sep 2010 10:22:26 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 25 Sep 2010 10:22:26 -0700 (PDT)
Date: Sat, 25 Sep 2010 19:22:26 +0200
Message-ID: <AANLkTi=1_wZYRsZz5LjnkOpBtHHs0SanzJAUaJkGQnAE@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: opensync: fetch failures
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
X-List-Received-Date: Sat, 25 Sep 2010 17:23:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I bumped into opensync, but lots of recipes do not fetch any more:

opensync/libopensync-plugin-evo2-sync_0.22.bb
opensync/libopensync-plugin-file-sync_0.22.bb
opensync/libopensync-plugin-file_0.18.bb
opensync/libopensync-plugin-gpe_0.18.bb
opensync/libopensync-plugin-irmc-sync_0.22.bb
opensync/libopensync-plugin-irmc_0.18.bb
opensync/libopensync-plugin-syncml-client-plugin_0.1.bb
opensync/libopensync_0.22.bb
opensync/msynctool_0.22.bb
opensync/msynctool_svn.bb
opensync/syncml-client_0.1.bb

sometimes the url is to a website that does not exist, sometimes it is
a wiki attachement that is gone.
opensync itself is at 0.39.
Guess these are orphaned. No idea who the maintainer is. I'd suggest
if there is no maintainer to move these to nonworking.
They seem too old to invest any time in.

Frans


