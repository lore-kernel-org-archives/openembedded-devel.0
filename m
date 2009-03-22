Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1LlSTS-0000jx-2b
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 19:32:42 +0100
Received: by bwz19 with SMTP id 19so1395265bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:received:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=2hFwIeHiI8tdEcy36vfWQ2e/MQk9ABgB9DdQEgo39KE=;
	b=W7J9lQCOcvbxLtwgUBj+yGwlZhGRQ02JVHF2xGWqYZRGR5P6MYOgP3mROMYK4+D6Ll
	kPyzxR5d0bp8+Yp7CtgamVGGJvG005JRMFIHjvIl2IEqEzGstrkrBv7jDty4nISk6R98
	BaxHhy6F4KBo599qA4WYJPGB7Bp5eYi3JIxcs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=SWj+NTbPCx8E9RmYqWVrFKW+xuzI1bnddn6aSHkVi14eLvqHfRPNW7MFIwLpJULV1l
	1KunSke0FsfsJVbkUNSqAzbT9PJ43Pa6Rk5bgSQrAqBNnw6uUATZ63GXjOY7WUz+8CCS
	pyfCvnJUQ9Vd+0skzIjvd+kqhv0NE4wWoGZN4=
MIME-Version: 1.0
Date: Sun, 22 Mar 2009 19:31:04 +0100
Received: by 10.223.110.211 with SMTP id o19mr5272026fap.57.1237746682685; 
	Sun, 22 Mar 2009 11:31:22 -0700 (PDT)
Message-ID: <80a0c20d0903221131r263367bcw9c401d93a75f98d3@mail.gmail.com>
From: Matthieu Poullet <matthieu.poullet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Issue with the cvs and wget fetching obey PATH workaround
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
X-List-Received-Date: Sun, 22 Mar 2009 18:32:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I've a problem with the commit
2652dfa9fb6da4423f9d556aaa289ac6fc198fe5 "bitbake.conf: make cvs and
wget fetching obey PATH from the metadata."

Instead of downloading in DL_DIR, it downloads in DL_DIR/--no-check-certificate.
If I revert the commit everything works.

It's probably a simple syntax issue, but I'm not sure on how to fix it.

Regards,
Matthieu.


