Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlpdU-00078D-MY
	for Openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 22:53:25 +0200
Received: by fxm6 with SMTP id 6so624667fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=J2gxHAh1ijRvoY+95giHE6lxOi55s87IzzC/OePRHRc=;
	b=uJpvwLIx15ZECekOh5bJKzTKlNfmxW8Icy7pL3v5fgqNntaDJmsdCkbhhsE5KlaYj9
	YD4StdFiTg6EUBr/ralEyHgGqsoeiWgNHbl3Gthuktgs5pFdher4OaxLuoOcToC+bJU+
	Qjo/E9YIuOPN8n6oSyMd6ifiD0NuYyGsACCKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=C+jvfVKx0Th1WKkJ+KoZPra/y7Kf2ICfFSnnhrRm7wzLpveNNejvLjypr6C+3zxpYP
	GXtwXrkg6oxHKP/ji+qnAc2nsmlmUUNOhLQamARPWBrHSoDX/zhqOvtbHAPCSYnyJmRb
	VDjJF9TFtjFP2htHDvrZQzHgY+QIHEPFUkzFQ=
Received: by 10.103.40.6 with SMTP id s6mr230483muj.111.1282164785202; Wed, 18
	Aug 2010 13:53:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.102.220.19 with HTTP; Wed, 18 Aug 2010 13:52:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Aug 2010 13:52:45 -0700
Message-ID: <AANLkTinW6EWy5rWVHmQoCc_BsC=2XDdnoXWSgnh73Cvn@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: etk is in obsolete but there are recipes which depend on it
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
X-List-Received-Date: Wed, 18 Aug 2010 20:53:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

This commit below moved etk to obsolete

commit bd75858d8e523dfbed244bf4046b5ce01eeee690
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Fri Mar 19 18:14:59 2010 +0100

    efl: move epsilon/etk to obsolete, because they're not supported
with newer ecore anymore

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


However there are recipes which still depend on this

e17/e17edje-player_svn.bb
e17/edje-editor_svn.bb
comic-reader/comic-reader_svn.bb
e17/exhibit_svn.bb
efl1/eflpp_svn.bb
efl1/evolve_svn.bb
openmoko-projects/om-locations_git.bb
openmoko-projects/diversity-radar_svn.bb
openmoko-projects/assassin_svn.bb

should they also find their way into obsolete ? or is there a new
replacement package they should depend on

Thanks

-khem


