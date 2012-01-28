Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rr896-0001nA-Lu
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jan 2012 14:16:44 +0100
Received: by vbbff1 with SMTP id ff1so36957vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2012 05:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ulCfPTRwnOqt4Te+LwEtqJftwuuKgrjNS7Q/sm8EPiw=;
	b=uvK6kqUiTn9YIIh67Y9j5qXdNubV+oz20ZKJX1/Pe9M0kmTt/RGbTZl+Kp10aDw+S8
	apZsJKMXnW1vXc0Fr/FbeqdULb8lvgaR2kY5TXxLdPFu7oRjtjJHPEfG8TXGxLDyV2U1
	Cl7kYa8AayBXfIa5bXFJZ64jJ6L3RVTxMY/R4=
MIME-Version: 1.0
Received: by 10.52.26.206 with SMTP id n14mr5270916vdg.51.1327754552282; Sat,
	28 Jan 2012 04:42:32 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Sat, 28 Jan 2012 04:42:32 -0800 (PST)
Date: Sat, 28 Jan 2012 13:42:32 +0100
Message-ID: <CACW_hTaJXTrAP4YTTA2CwXFe7sYeY3yEFi8JfNbhiEzZbMttqg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: get OE git hash tag in executable
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
X-List-Received-Date: Sat, 28 Jan 2012 13:16:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

In order to allow backtracking of the sources for a binary build with OE, I
would like to (automatically) add the hash of the top level commit (and
maybe also the branch) of the oe git tree my recipe lives in).
E.g. in main.c I would like to have a var say:
const char * const buildfrom = "oe branch 2011.03-maintence hash
1234567890"; or something like that.

What would be the best way to get that info into my program?
(my best guess at the moment is to use a macro and compile with
-DOE_IDENT="....." or so and say  char *buildfrom = OE_IDENT; but not
really sure what the best way is to fill OE_IDENT and pass it to the
recipe.)

(and of course I'm open to alternate solutions; as long as I can trace back
the git hash)

Thanks in advance for any suggestions!
Frans

