Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4326FF70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 13:11:21 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id lx4so6089179iec.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 06:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=NzI3axlCC0p6uXG8Okq2TyFbY+k+Qsc2B/z/oOc4uR4=;
	b=gifJFBYcUvQKH7a7Kkws+RaMhGam7W1kGvuLDejhOkFei3PHRXYB8oFVrI/y5iAX5a
	XAxEXtc7mjiqumdIn7kj5MBf5hhPof7a5tWqnSMbpdW8Bnkn8rxb7KsMA6S5N0PksxbV
	i4VnauJoKKKNBuvlzstTYF4XlbZvOL/FrPH3Q/kHfvlyeNP7JMUhKc85mvQ8gbb8glv1
	NfMty6K7sw8fJKmFrpXequ7jTpHt9sBW970KU8Cb1k+3Z5axEwnF9/gH9dw7bEO4HcsM
	bttYrwIMCfKsMrAN4/KWUjFWgePRTM203ssO6ThL/23oHdPb38/iSUthKUTjklQdzMCq
	wUxA==
MIME-Version: 1.0
X-Received: by 10.50.45.38 with SMTP id j6mr32585149igm.10.1403010682662; Tue,
	17 Jun 2014 06:11:22 -0700 (PDT)
Received: by 10.64.127.38 with HTTP; Tue, 17 Jun 2014 06:11:22 -0700 (PDT)
Date: Tue, 17 Jun 2014 22:11:22 +0900
Message-ID: <CALYKT1i+KV84OBNdWWbARGnbrVok8ARiBS0zR9dihJOebBV_sg@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [Question] How can I use gebserver on oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jun 2014 13:11:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi list,

I am trying to use gdbserver on oe with gdb-multiarch on ubuntu PC.

When I try to invoke gdbserver as shown below :
/ # gdbserver /dev/ttyS0 /usr/bin/my_app

I get error message shown below :
Process /usr/bin/my_app created; pid = 1046
Could not open remote device: Invalid argument.
Killing process(es): 1046

How can invoke gdbserver correctly?
There is no file /dev/ttyS0 so I tried with /dev/ttys0 It is shown below:
(There exists /dev/ttys0)

/ # gdbserver /dev/ttys0 /usr/bin/my_app

Process /usr/bin/my_app created; pid = 1060
Could not open remote device: Input/output error.
Killing process(es): 1060

One thing I am not sure is /dev/ttys0
I need to use serial but I don't know what device name should I use.

Can any one shine some light on my problem?

Thank you very much.
----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

