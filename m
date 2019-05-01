Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id D87A37D674
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 07:46:08 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id u12so14348383iop.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 00:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=o+AlVubt8I/jUVvGYqV0o2kto5M8trJ3pTU9I7uu1vc=;
	b=tdM8o5n8JqZIHX/wKkIpWs/+r1JXxwpPe9ufzg/w1WA5Hy03fZmf5hlg6qlC28S5C8
	veL1Q8bv3YJFi8msF/wyaIqyRx7ejWtJohSAlQh0t12nG4+gdoPNirbS1bbk0D7DxfUJ
	NWHPswwzud5hA80w0nC3OLtTRSWw/KEFPu7sZA7BwnZe/X8Ed4agXSAzagnJX6OuOYir
	koh1Vara1Jqf5npSI/Y2kh/p03vh+DmxFDr5aRmZwzBNzW3gq73JSl4Ztr3rjxnbIWMc
	X93o+4lbaT/CbNZ3XQBNFyXQi8cV6iqqwyItbLUoxIO0KbAnYrBbGHcka2nqcFcPXsYX
	R9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=o+AlVubt8I/jUVvGYqV0o2kto5M8trJ3pTU9I7uu1vc=;
	b=h1dynYhpNXQ2S+shXcQSTMCWNJ04D1VIUgDtkcby4DcOsy/Bgqp6XowujV/mgK7J8f
	xnxJvlV5z8EmCtY0zpBPBXRxKeWQotVvJmfSVjQge4kISq6gVVSkPZQfp8KkozFgnPEa
	Y16LrLOD7DFr3zK+kPxwT19YyxU0XIAKzPv/Xe5cJis9xzeDWF8bHa3sPE+AWzUmAqtX
	F2WZfwlNtvVRclKAlXbKD+EDlUT68dRd+QIRQup5EWR9/DNFBFpxZ7GVMRNpl1V/m/Bk
	zGc6Y+sL5ZtQqgdM5lv645VhZhyq2avu+IVVVRpOgUvVuq+8D9Z7N4b2dfDRwfdPu7T/
	F8rw==
X-Gm-Message-State: APjAAAVeSIU+cMd2lNEOsImqACiKBSMSI7zWaMLp/cMHCBLwzj1mD95t
	2ysUy7LdXen6zJbWwbqHw6tnT/xaIt6vO0/b4rqzIExS
X-Google-Smtp-Source: APXvYqxVNs41p7XIHgscAVHZTG9p/n5L2d9iJL5QVIQW+7R//Qhxx8tIZ6OMwpGZW8paMiPQPOkUq1gchCb5lNJ89ew=
X-Received: by 2002:a6b:6e17:: with SMTP id d23mr30941873ioh.159.1556696769723;
	Wed, 01 May 2019 00:46:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c06:0:0:0:0:0 with HTTP;
	Wed, 1 May 2019 00:46:09 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Wed, 1 May 2019 17:46:09 +1000
Message-ID: <CAA=hcWSV1eEmc29=69pxGc0UXpF8mLvFQNzpPQ=N9AUiJD=QSw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: fatal error: glib.h: No such file or directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2019 07:46:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I added DEPENDS += "glib-2.0", I can see glib-2.0 in build, but why it
still complains about not find the glib.h?

fatal error: glib.h: No such file or directory
|  #include <glib.h>

Thank you.

Kind regards,

- jupiter

