Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1Mi4NJ-0000Qq-SP
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 12:44:40 +0200
Received: by bwz6 with SMTP id 6so1639467bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 03:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=J/e56IqLLGKujCbU1doBmmT9IOa4zWE/lH/OXXXBfN8=;
	b=BcSqmO4JrTTTGBVBQz6ZqWgBOnKKuOA3B6AJ2CIp2bGE5zk/unv0cNXLw5vzVTPx1z
	TgJhuxrcvJuPYZ4b1y9HJjolRnbaN0TNW57GyLuxoyqFVMG6Sa+v8SjWTT/DsZ97IKxG
	l+7TzuJV6a6edCFxTIa8z2eqbSlHsBrf3qGzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=OlJSHwvaz7D1BZP4rnmf2n7tLUKq3P3v2C6JG9GCCK980iGjHXDNKPCAg7O0n0zT0Z
	kIZkz381ZYh2wGVQ95G/CwObXG+xTP0fIliJOrZk0qrxkMLjW2jbt11TCkQ4gdQ3OiRP
	XDRHvNnSf2ZhS9F2hK6SrLXdrrAzmNyOKtbgY=
MIME-Version: 1.0
Received: by 10.103.86.22 with SMTP id o22mr2053004mul.102.1251714366326; Mon, 
	31 Aug 2009 03:26:06 -0700 (PDT)
Date: Mon, 31 Aug 2009 13:26:06 +0300
Message-ID: <fce2a370908310326i1f784f25qd4ed91d7864ef38a@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Unzip missing
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
X-List-Received-Date: Mon, 31 Aug 2009 10:44:50 -0000
Content-Type: text/plain; charset=UTF-8

Hello!
I encountered the following error when unpacking faad2 recipe on bare
debian lenny system (stable/2009 tree):
sh: unzip: command not found
The problem is that there is no 'unzip' utility on the host. I tried
to specify DEPENDS = "unzip-native" for faad2 recipe but it somehow
doesn't wait for unzip-native to be built. Any suggestions on how to
make faad2 unpack task wait for unzip-native staging? Or should we
just put unzip into list of required host software in sanity.bbclass?
Thanks for help.


