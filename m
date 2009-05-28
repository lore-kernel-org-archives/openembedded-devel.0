Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aapo.rantalainen@gmail.com>) id 1M9k3K-0002NX-Sr
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 20:10:08 +0200
Received: by bwz19 with SMTP id 19so5544163bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2009 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Ya/ndwhzZW4bx55ov/ZNy1ZUZLXBDoXY0ofuqNOndw4=;
	b=gMXukNWQ6yFV+AwmtrXI5bhkOk5e3FU3mSmWjt0hHV1NplzVNuRMYqJyAg23MIpykO
	mYxAuSofSk2UKTWJUl25Z0OesnTPDygoh7+P+Wz5AgQQkt2D3c6WrRD9fArmCx4FptuG
	kj8PSxwXTHCe6wfH8TLboEHxb9xU+FzDVPvwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=l3vvp8AlOLOeJWVXy3PEm/vAg34ZVURwZjwhs9oW8AKdtQIhyn0N/65kJOAO04u3Ub
	CEb7JA1ZoF21mnmXM7oxUQjKMbzrhjm3k6mZ259bdHQF6El0HFJpeY0TAKBGFSZzIsYg
	LpbP0iilNcY8+13RFMsvf5cHYaRPMwzMNb5hM=
MIME-Version: 1.0
Received: by 10.223.112.130 with SMTP id w2mr1357636fap.65.1243533703452; Thu, 
	28 May 2009 11:01:43 -0700 (PDT)
Date: Thu, 28 May 2009 21:01:43 +0300
Message-ID: <d67d61f10905281101o93474adu7d9ebdbca6fd0a1@mail.gmail.com>
From: Aapo Rantalainen <aapo.rantalainen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: openttd in openembedded. new version on upstream
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
X-List-Received-Date: Thu, 28 May 2009 18:10:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, there are new version of openttd (0.7.0)  [www.openttd.org].
Most important is feature to scroll map with left mouse button. So the
game is playable with stylus or some other pointer with only one
button.
For some reason configure detects icu wrongly, even it is not
installed, it tries to use it. Configure --without-icu or bitbake icu
works.

Openttd can be packed with gpl-data files (without data files, it
can't be even started). Data files has 89% ready graphics, but no
sounds yet. User can still use original/proprietary data from
Transport Tycoon.

Now user must do after installing:
cd usr/share/games/openttd/data
wget http://dev.openttdcoop.org/attachments/download/90/OpenGFX_Alpha4.2.tar
touch sample.cat
openttd

I suggest this data pack is provided with binary.

http://wiki.openttd.org/Graphics_Replacement

-Aapo Rantalainen


