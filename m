Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1PetwK-0004lI-AI
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 19:36:29 +0100
Received: from homiemail-a76.g.dreamhost.com (caiajhbdccah.dreamhost.com
	[208.97.132.207])
	by hapkido.dreamhost.com (Postfix) with ESMTP id DF28B17A1FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:29:51 -0800 (PST)
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 0592E45806E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:29:04 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:content-type:
	content-transfer-encoding; q=dns; s=gumstix.com; b=SwzJhBzz6oSph
	pumfayv2sWLns2krgBjhje2WGMIsqI2mPX2TgpxAT3ljVeLBN4FC7aZjj5yMCCVc
	vT/HexmeYwzjgFVHxPUJ7KfFoTC9LDAH3E/qCBLZ99Ter1Y9/p2xIgCsVqEHz9TD
	uFa6JMSCxG3UXg0vbCEsa89LXHLN34=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:content-type:
	content-transfer-encoding; s=gumstix.com; bh=yhoi/1Ye/oppdBgRTYB
	74SqRzzI=; b=gNlpQPE4Ha7Yl3VxSSmPOWdqxqFLpiOQLzSDuy151gaB7DlrnMQ
	aXadK9dCmQuhhhBalMJjn36fiu5cHiMOzTiujDlVO1CkAlQQ+mDug/1c97lErm6F
	nfzzCVYCqpSS/CKkz7SPfGGArvllipJnNvbekmUo45Zgf9Gko+iWYwFk=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id D547245806A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:29:04 -0800 (PST)
Message-ID: <4D347C60.6000805@gumstix.com>
Date: Mon, 17 Jan 2011 09:29:04 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: EFL_SRCREV bump breaks GPE/enlightenment
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
X-List-Received-Date: Mon, 17 Jan 2011 18:36:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Changing to EFL_SRCRV 55319 causes display problems for buttons and the 
workspace manager. Mousing over the main menu causes Xinit.d to restart.

before crash:

# ps fax
<snip>
   955 ?        Ss     0:00 gpe-dm
   958 tty3     Ss+    0:00  \_ Xorg -br -pn -dpi 100 :0 -noreset
   959 ?        S      0:00  \_ run-parts /etc/X11/Xinit.d
  1036 ?        S<L    0:03      \_ /usr/bin/enlightenment
<snip>

after:

#ps fax
<snip>
   955 ?        Ss     0:00 gpe-dm
   958 tty3     Ss+    0:01  \_ Xorg -br -pn -dpi 100 :0 -noreset
  1100 ?        S      0:00  \_ run-parts /etc/X11/Xinit.d
  1139 ?        S<L    0:03      \_ /usr/bin/enlightenment
<snip>

Reverted changes to e-base.bbclass seems to fix the problem

# git revert 004321e0878162331908acda8bdaaa31a2aa6278
# git revert 2c7181fda31fa0bc215b5425ef872361944f4ae5

I'm using the omap3-desktop-image on a Gumstix Overo.


Neil


