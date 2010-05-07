Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OAWrD-0001t2-9b
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 01:21:23 +0200
Received: by fxm11 with SMTP id 11so1155836fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 16:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=nKUK9B5wCCGOp2FwzKYEn8pal729cYq/ctB4AaTlBIg=;
	b=fGmnW1VvqKXtcnE9+kJEE1DNI3a1OIwi3x/yXZK/QmVZpBEwc2FgZw7sOn3L3GIsCe
	QVdikQ2eDe4ZBYp3lGMm23NoEFLBDuKKOwW/ARpVzkZN7t4ei8rzBV6H9fTdga3EZixB
	7oHtkkv3NKnyjlnfgh10TK4htjgq6fM3Uk8W4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=OkoB7+AdIJ5KIFlOvMouNPlyLDdbY8lvZ3XV2+yCORq93BCtlvf6mLlbW8rUXlpMIs
	O0biBOJFBIS7dlSx3ZXswFN8HX/qzx78Hk07K8qcUrEXGsZeOfkITFZ0BvpVoJ9X4He9
	6XlmpjnmwGtEVXZ6ACxkNT+SJ4qN75VtMS8z0=
MIME-Version: 1.0
Received: by 10.239.142.73 with SMTP id f9mr67302hba.107.1273274253500; Fri, 
	07 May 2010 16:17:33 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Fri, 7 May 2010 16:17:33 -0700 (PDT)
Date: Sat, 8 May 2010 01:17:33 +0200
Message-ID: <v2sd1b08f941005071617u31274631hcddebb5b9eeb888d@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gtk+native missing dep ?
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
X-List-Received-Date: Fri, 07 May 2010 23:21:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I repeatdly see console-image failing *from scratch* because
gtk+native do_compile errors out with:

 Cannot load module
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la:
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/mo
dules/input/.libs/im-xim.so: undefined symbol: g_realloc_n
| /oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0/gtk+-2.20.0/modules/input/im-xim.la
does not export GTK+ IM module API:
/oe/build/tmp/work/i686-linux/gtk+-native-2.20.0-r8.0

It seems this is defined in glib-2.0-native-2.24.0-r4

So I suspect the second build is fine because glib-2.24.0 finished in
the meanwhile.


Regards

Andrea


