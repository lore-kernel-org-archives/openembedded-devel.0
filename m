Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pq9EV-0004HW-8U
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 20:09:48 +0100
Received: by qwi2 with SMTP id 2so2617643qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 11:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=r74hWQBxDVnzpxHhViUNih07ms0CsQkiyrxjwYRBSKc=;
	b=Nr6I/wDggJ0U24msVYJI1U2a6k+huO/0b7PcEcbL5cW5s7lA7FNEaDRlAY+Vnnq0tD
	2cQoqbeWsR2aQlZJ4kBPIb9h6ywPS9s5Hm0v2u6sIvmEDFPEg7qtLJQaOe3VcYch3jRJ
	H7mMs8nPEL+TAciYblzfUmsDGWvxYSqIee3HU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Y12ZU6lgtFKVORJ9fVYwq1sUW4bYrDe9fgn29GSNKdCA+bln8CE/dPDjBlVdFNYA+a
	PZauwDDgQPZcptRi/xb2GmMgshoJEmryBrU/moELD6wFM8mNkYqIVfWYA1+fXn+fW4Tx
	mqbgh2irGmDmAkhA3vyU/uMz61K6ChlVkNshs=
MIME-Version: 1.0
Received: by 10.229.241.194 with SMTP id lf2mr2667128qcb.222.1297969704834;
	Thu, 17 Feb 2011 11:08:24 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Thu, 17 Feb 2011 11:08:24 -0800 (PST)
Date: Thu, 17 Feb 2011 20:08:24 +0100
Message-ID: <AANLkTikjzq=jS=+RTpZ=uxeA_5++CfZT3RetB9et29nS@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Broken kernel module dependencies
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
X-List-Received-Date: Thu, 17 Feb 2011 19:09:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

lately I have noticed that the bootstrap image I build contains the
orinoco-cs.ko kernel module, but doesn't contain orinoco.ko (which is
depended on by orinoco-cs.ko).

The problem is that package has only these dependencies:
update-modules, kernel-2.6.34

AFAIK dependencies between modules are retrieved by parse_depmod()
from kernel.bbclass.

Here it returns things like:

{ 'kernel/drivers/net/wireless/orinoco/orinoco_cs.ko':
  ['kernel/drivers/net/wireless/orinoco/orinoco.ko',
    'kernel/net/wireless/cfg80211.ko'],
}

It is later used by get_dependencies() in the same file.
This function does something like this:

file = file.replace(bb.data.getVar('PKGD', d, 1) or '', '', 1)
if module_deps.has_key(file):
[...]

File value in my case (after replacing) is:
/lib/modules/2.6.34/kernel/drivers/net/wireless/orinoco/orinoco_cs.ko

Of course  'kernel/drivers/net/wireless/orinoco/orinoco_cs.ko' !=
'/lib/modules/2.6.34/kernel/drivers/net/wireless/orinoco/orinoco_cs.ko'
which causes my problem.

What can be done to fix this? How did it get broken (last week or so)?

bye,
Filip Zyzniewski


