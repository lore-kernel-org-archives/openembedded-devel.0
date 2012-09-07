Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1T9wvA-0003xq-GP
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Sep 2012 13:40:24 +0200
Received: by pbcwy7 with SMTP id wy7so4244621pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2012 04:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/YWhcWhw36jjL4Dhu7CKpyWpnTFYZR8fukWxiOXKtnw=;
	b=xPfVkOq3NECR/4t5aLMpIpHyW2hmAdeVC8f/c6/e+r+40EEFiU4l0T0KBBL5SubGSV
	YEZe5WMSGy197fCnT701JRv9seJy6QFBWi8uxXAnfyK+2XMwm+G66w0jFTaLfdK3lRs5
	6a09Me+XnVsgjPIbD52IS1pczIV4ym1z0uP+MqkMRw3BeOxrJLJj4n3wHJdDCzmoVn6m
	5zIYqXULUxHOed9dDbG9FGnLC5JFXpvGNhnhIHHSjjgfM0QXLPa/r36qVNLDHlUd7yr3
	HK42ErTl+utXNb7pvXcTzryxrvvRMSM55y1y2JbyWiuDrTRutGr8tp6kbC8ewHqS9dDU
	H4Cg==
MIME-Version: 1.0
Received: by 10.68.203.200 with SMTP id ks8mr9630943pbc.142.1347017278186;
	Fri, 07 Sep 2012 04:27:58 -0700 (PDT)
Received: by 10.68.14.201 with HTTP; Fri, 7 Sep 2012 04:27:58 -0700 (PDT)
Date: Fri, 7 Sep 2012 13:27:58 +0200
Message-ID: <CACW_hTYFeqSYx5R9rgf9vV0GG-iTcnjKx+czrVXX=rUTx2z_xw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: oe classic: eglibc
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
X-List-Received-Date: Fri, 07 Sep 2012 11:40:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure if anyone is still interested in oe classic, but while rebuilding
some sw using oe classic I noticed the eglibc recipes did not build any
more as upstream changed things in the repo.
I've locally fixed this by changing SRC_URI from
SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
into
SRC_URI = "svn://
www.eglibc.org/svn/branches;module=${EGLIBC_BRANCH};proto=http \

builds and tests fine. If anyone is tempted, feel free to author a patch.

Frans

