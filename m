Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSTlc-0002cx-J5
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 12:09:35 +0100
Received: by yxe1 with SMTP id 1so15959367yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=2GXipUoFKYezExseBQ/HaydVZ6yq1AGhJlMbD5buT+c=;
	b=Kb6v80Tnx8Z0M7SLJ0ybX2XjaP7rbNvCESTjHlVF/iIpYR6Nyl0h/RPeTaIAiGjoI4
	XL4QBgRlsKXb3HehcSDlX19HKHiUTXGSy+KKIh1vQJckxv+E0dJNorAUkXk5tVLYJdY+
	65WrzqPKswIrkmpOXe1njocb8Gcw9swQMnLDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=kunURLmNwJ6mKEc6t9AjEY9+BSGZZPPNsD66+x6VuAKj2jFNMMD3yCRMKJFNLf7x2g
	lXyFApmK2RiYH0HfCwnHEQHdGm+GkRdyzfMnEBV9jUizPiSML4iuXXUsyJ4TVKBmQ5m9
	M+/5khda+Er4XAOOnbotun1RqBawRb+jFyNEA=
MIME-Version: 1.0
Received: by 10.101.184.1 with SMTP id l1mr2585861anp.198.1262776047867; Wed, 
	06 Jan 2010 03:07:27 -0800 (PST)
Date: Wed, 6 Jan 2010 12:07:27 +0100
Message-ID: <ac9c93b11001060307w301eca52kce287f410ae4a69a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: bitbake image building problem; possible bug in bitbake; also some 	openembedded image.bbclass suggestions
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
X-List-Received-Date: Wed, 06 Jan 2010 11:09:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm mailing this to both the bitbake and oe dev lists. The problem
might be bitbake related, but I can't explain it without openembedded.
Also there are some openembedded improvement suggestions too.
BTW please be gentle with me wrt the python part as I am really a python n00b.
And notice that I am not subscribed to the bitbake-dev ML, only to the OE one.

Problem: when I build an image with a static devicetable it does not build.
This is with a personal image for which I have an own recipe. The
device table file given to IMAGE_DEVICE_TABLES resides in the recipe
directory and in the .bb file I say:
IMAGE_DEVICE_TABLES="mydevicetable.txt"
Howver if I change to IMAGE_DEVICE_TABLE="mydevicetable.txt" it works again

With bitbake 1.8.2 this worked like a charm. With 1.8.18 it does not
work any more.
The file to find the exact location of the devicetable is in image.bbclass.

It contains this func:

def get_devtable_list(d):
    import bb
    devtable = bb.data.getVar('IMAGE_DEVICE_TABLE', d, 1)
    if devtable != None:
        return devtable
    devtables = bb.data.getVar('IMAGE_DEVICE_TABLES', d, 1)
    if devtables == None:
        devtables = 'files/device_table-minimal.txt'
    return " ".join([ bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
                      for devtable in devtables.split() ])

In the func I added a print for BBPATH. When comparing the 1.8.2
bitbake and the 1.8.18 bitbake I noticed that in .2 the recipe dir was
in the path and in .18 it was not.

Diving deeper I compared 1.8.2 and  1.8.18 and noticed that in
BBHandler.py a concatenation to BBHandler was removed.
Drilling deeper in the git log I found this commit which seemed to be
the bad guy: http://cgit.openembedded.org/cgit.cgi/bitbake/commit/?id=a50104766965a8f48a8455502b804a18a9be5c02
After restoring the change to BBHandler things worked like expected.

This brings me to the question whether having the device table in my
recipe dir is desirable (personally I'd say yes) and whether the
BBPATH should or should not be extended with the recipe dir in this
case.
If yes, there is a bitbake issue and the commit above might need to be
reverted (or we need another change somewhere)

Of course I do have a workaround. If I give a path which is relative
to a dir in the BBPATH things work too. (e.g.
IMAGE_DEVICE_TABLES="recipes/myimage/mydevicetable.txt" )
Or copying the device table to the top of the tree (or the files
subdir and adjust IMAGE_DEVICE_TABLES). However this all seems a
little bit less clean.
Also using  IMAGE_DEVICE_TABLE works.

Meanwhile, as I had to peek into image.bbclass I would suggest some
additional changes to the func above (as my python skills is mainly
reading, I will not provide a patch):
I would suggest that
1) if IMAGE_DEVICE_TABLES exist, but is not found that somewhere along
the line an error is given, either here or in the caller (the recipe
gave a var so there better be something)
2) extending the possible locations of IMAGE_DEVICE_TABLES by checking
if the file exists without a BBPATH prefix. That would allow for
absolute paths and (hopefully) also things like ${S}/mydevicetable.txt
(perhaps changing
bb.data.getVar('BBPATH', d, 1)
into something like
bb.data.getVar(".:" +'BBPATH', d, 1)
is sufficient to achieve this.

I hope this helps. If there are unclarities, feel free to mail me or
ping me on irc (eFfeM on #oe).

Frans


