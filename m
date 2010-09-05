Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsB7e-0005Z5-AK
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 11:02:49 +0200
Received: (qmail 14554 invoked by uid 503); 5 Sep 2010 09:24:21 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 5 Sep 2010 09:24:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Sep 2010 11:02:08 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 5 Sep 2010 11:02:06 +0200
Message-ID: <4C835C8E.1000008@eukrea.com>
Date: Sun, 05 Sep 2010 11:02:06 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=j4E6ZLet=qemx-Ec1CaySKLCuzZMDriX9WQ=T@mail.gmail.com>
In-Reply-To: <AANLkTi=j4E6ZLet=qemx-Ec1CaySKLCuzZMDriX9WQ=T@mail.gmail.com>
X-Ovh-Tracer-Id: 6669268098437918025
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ushare_hg (the leading ushare recipe) does not fetch
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
X-List-Received-Date: Sun, 05 Sep 2010 09:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Frans,

Le 05/09/2010 10:41, Frans Meulenbroeks a écrit :
> I tried to build ushare, but it fails to fetch the source.
> This source is at http://hg.geexbox.org/ushare/summary
>
> II'm not a mercurial wiz, still tried a few things, but can't seem to
> be able to resolve it.
> Can someone with more hg knowledge peek into this?
>
> Meanwhile, I suggest adding a DP of  -1 to the hg version. The 1.1a
> version still builds properly.
>
does the attached patch to bitbake fix this for you ?
(you need to delete the directory in downloads :hg/hg.geexbox.org/ushare 
before).

Eric

diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
index d075638..bb156ed 100644
--- a/lib/bb/fetch/hg.py
+++ b/lib/bb/fetch/hg.py
@@ -138,6 +138,7 @@ class Hg(Fetch):
         # Even when we clone (fetch), we still need to update as hg's clone
         # won't checkout the specified revision if its on a branch
          updatecmd = self._buildhgcommand(ud, d, "update")
+        os.chdir(ud.moddir)
          bb.msg.debug(1, bb.msg.domain.Fetcher, "Running %s" % updatecmd)
          runfetchcmd(updatecmd, d)



