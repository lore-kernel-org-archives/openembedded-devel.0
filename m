Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LfHKG-0000N1-Sa
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 18:25:40 +0100
Received: by fxm11 with SMTP id 11so30747fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 09:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=u563ok8yNnhpxLzSNSh63I3IMCxwNGJERiXBQXJr9EA=;
	b=t/1hlFqHHmZNbYQrlglGbbbUrNJlokxyXE69gO8KC1dZWAgL6hIM3062bVTg5vRuQw
	WZKE6EhjfexFUdI3ibGU4KS/dDG9dy8lSwUC5uJbdL0rOPQf/Cc00/g7OWEV8qJKEjNA
	5fnX1/AsXKTXZy4nPPCqXXUzXThYG8M4XE/CI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ou9BXF6SVQYXTvCbDwvLyj/xkrdW4tYEzewYypl4x7CAzbR0WudUW88BtpqjlPHvVB
	PlFmUNZld2Pnaf9mfBQ9+KEFnNtxmIzZ9ZX4KJD11ZvSUoR/DSxyFTHMUqOasQ9GCPX6
	9eeySvzJst6dXqJRiaPR8nWNShq6DxE2Jsrc4=
MIME-Version: 1.0
Received: by 10.223.126.69 with SMTP id b5mr1153445fas.54.1236273677668; Thu, 
	05 Mar 2009 09:21:17 -0800 (PST)
Date: Thu, 5 Mar 2009 18:21:17 +0100
Message-ID: <ac9c93b10903050921y59233df1o731fb4983e22e12f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: need help: cdrkit & bitifields
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
X-List-Received-Date: Thu, 05 Mar 2009 17:25:41 -0000
X-Groupsio-MsgNum: 8284
Content-Type: multipart/mixed; boundary=001636c5a82f6714a204646265d9

--001636c5a82f6714a204646265d9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to make a package for cdrkit (recipe attached), but I am
kind a stuck.
The ported version does communicate to an USB DVD writer, but does not
recognize the type, whereas the same drive is recognized under
opensuse.

The data I get from the inquiry command ( wodim -inq -v -V ) is
initially the same but the result of inquiry is interpreted
differently.

I've tracked it down to the following:
in ./include/usal/scsireg.h it says:

struct  scsi_inquiry {
        Ucbit   type            : 5;    /*  0 */
        Ucbit   qualifier       : 3;    /*  0 */

        Ucbit   type_modifier   : 7;    /*  1 */
        Ucbit   removable       : 1;    /*  1 */

        Ucbit   ansi_version    : 3;    /*  2 */
        Ucbit   ecma_version    : 3;    /*  2 */
...
Ucbit is an unsigned char

In wodim/scsi_cdr.c function getdev a pointer is made to the data that
are read from the drive:
        register struct scsi_inquiry *inq = usalp->inq;

The type is in the first byte, which for my drive is 0x05
on opensuse this gives a type of 0x5, and a qualifier of 0 and on my
beagleboard it gives a type of 0 and a qualifier of 5.
Apparently bitfields are orderd differently.
How can this be fixed?

Frans

--001636c5a82f6714a204646265d9
Content-Type: application/octet-stream; name="cdrkit_1.1.9.bb"
Content-Disposition: attachment; filename="cdrkit_1.1.9.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_frxkrk4x0

IyBjZHJraXQgYnVpbGQgZmlsZQoKTElDRU5TRT0iR1BMdjIiCkRFU0NSSVBUSU9OPSJBIHNldCBv
ZiB0b29scyBmb3IgQ0QgcmVjb3JkaW5nIgpIT01FUEFHRT0iaHR0cDovL3d3dy5jZHJraXQub3Jn
IgoKUEFSQUxMRUxfTUFLRSA9ICIiCkRFUEVORFMgPSAibGliY2FwIgpTUkNfVVJJPSJodHRwOi8v
Y2Rya2l0Lm9yZy9yZWxlYXNlcy9jZHJraXQtJHtQVn0udGFyLmd6IgoKUz0iJHtXT1JLRElSfS9j
ZHJraXQtJHtQVn0iClBSID0gInIxIgoKZG9faW5zdGFsbCgpIHsKCW9lX3J1bm1ha2UgaW5zdGFs
bCBERVNURElSPSIke0R9IgoJbXYgJHtEfS91c3IvbG9jYWwvKiAke0R9JHtwcmVmaXh9LyAtZgp9
Cg==

--001636c5a82f6714a204646265d9--
