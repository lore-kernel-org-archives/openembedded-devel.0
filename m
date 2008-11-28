Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L63Pb-0000Lq-LV
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 14:29:35 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L63MW-000065-Sl
	for openembedded-devel@openembedded.org; Fri, 28 Nov 2008 13:26:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 13:26:24 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Nov 2008 13:26:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 28 Nov 2008 14:26:18 +0100
Message-ID: <ggorhq$6fc$1@ger.gmane.org>
References: <ggonls$p8a$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <ggonls$p8a$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Requiring root access for windowmanagers?
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
X-List-Received-Date: Fri, 28 Nov 2008 13:29:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-11-08 13:20, Koen Kooi wrote:
> Hi,
>
> What's the consensus on requiring root access for running an OE built
> windowmanager?
>
> Case in point: e-wm does 'renice -10', which only root is allow to do.
>
> Proposal: remove the 'renice' so regular users can start a window
> manager as well.

The patch:

index e5a6502..7d472fa 100644
--- a/packages/e17/e-wm/enlightenment_start.oe
+++ b/packages/e17/e-wm/enlightenment_start.oe
@@ -5,5 +5,4 @@ if [ -r /etc/enlightenment/default_profile ]; then
    . /etc/enlightenment/default_profile
  fi

-renice -10 -p $$
  exec enlightenment_start $E_PROFILE
diff --git a/packages/e17/e-wm_svn.bb b/packages/e17/e-wm_svn.bb
index 1000ebf..1aff958 100644
--- a/packages/e17/e-wm_svn.bb
+++ b/packages/e17/e-wm_svn.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Enlightenment Window Manager Version 17"
  DEPENDS = "eet evas ecore edje efreet edbus"
  LICENSE = "MIT BSD"
  PV = "0.16.999.043+svnr${SRCREV}"
-PR = "r21"
+PR = "r22"




