Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TrmtN-0005aU-RU
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:51:46 +0100
Received: by mail-pa0-f53.google.com with SMTP id hz1so10089101pad.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i/8KQqmSKRqf6y2eoZnmp1+DKh1NGOU4Ocdw5Rh7Nic=;
	b=WronpPOU5wGCkyaTVlk0VZvGjEhV+WWD2UIxvISRUPK8jmDKBxVPS5aEAzJxZYLAhT
	dwDCmKFRR6aI6+2gX/wHQEGE5PWlBPXpPfTobB13x6BNoYDlJUwvpejpls7990MZoTKz
	HSP4B+ZZDwS8cWKIEeGIUx5P3WPBoW6x1X9Qa7SWdWDZvUWUBZFP42lfjo1V27wlgW87
	2bC6gJkDDste1W42M+af3j/auPDNSUBolB8VsXdM51c+I0httOiOhgYnH4LbxVB5TzPF
	m8fCzFltweJp7UTBGL5iAU+eX7iGOsz5KHJe+LQYk0tcvP9X8IaYJL0l3Wp6kcQR8Lf0
	+pNQ==
X-Received: by 10.68.235.1 with SMTP id ui1mr9655256pbc.138.1357464997536;
	Sun, 06 Jan 2013 01:36:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qw8sm5164557pbc.39.2013.01.06.01.36.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:36:36 -0800 (PST)
Date: Sun, 6 Jan 2013 10:36:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106093635.GB3272@jama>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-9-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1357463568-26241-9-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH V2 09/25] atftp: Upgrade to latest from git
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
X-List-Received-Date: Sun, 06 Jan 2013 09:51:46 -0000
X-Groupsio-MsgNum: 42527
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2013 at 01:12:32AM -0800, Khem Raj wrote:
> Add patches to let atftp serve huge ramdisks >500M in size

I don't see this patch
http://patchwork.openembedded.org/patch/41955/
in V2, can you update status on patchwork to indicate which patches are
superseeded by V2 and which are still valid?

Thanks

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../atftp/{atftp_0.7.bb =3D> atftp_git.bb}           |   18 +--
>  ...tpd-0.7_circumvent_tftp_size_restrictions.patch |  158 ++++++++++++++=
++++++
>  .../atftpd-0.7_unprotected_assignments_crash.patch |  145 ++++++++++++++=
++++
>  3 files changed, 311 insertions(+), 10 deletions(-)
>  rename meta-oe/recipes-extended/atftp/{atftp_0.7.bb =3D> atftp_git.bb} (=
59%)
>  create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd-0.7_circu=
mvent_tftp_size_restrictions.patch
>  create mode 100644 meta-oe/recipes-extended/atftp/files/atftpd-0.7_unpro=
tected_assignments_crash.patch
>=20
> diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipe=
s-extended/atftp/atftp_git.bb
> similarity index 59%
> rename from meta-oe/recipes-extended/atftp/atftp_0.7.bb
> rename to meta-oe/recipes-extended/atftp/atftp_git.bb
> index ff1e11d..774dd68 100644
> --- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> +++ b/meta-oe/recipes-extended/atftp/atftp_git.bb
> @@ -3,13 +3,16 @@ SECTION =3D "network"
>  HOMEPAGE =3D "http://packages.debian.org/atftp"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -PR =3D "r4"
> +PV =3D "0.7.1+git${SRCPV}"
> =20
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;=
name=3Darchive \
> -           ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;nam=
e=3Dpatch \
> -           file://atftpd.init"
> +SRCREV =3D "be3291a18c069ae23a124ffdc56d64a5ff0bbec7"
> =20
> -S =3D "${WORKDIR}/atftp-${PV}.dfsg"
> +SRC_URI =3D "git://atftp.git.sourceforge.net/gitroot/atftp/atftp;protoco=
l=3Dgit \
> +           file://atftpd-0.7_circumvent_tftp_size_restrictions.patch \
> +           file://atftpd-0.7_unprotected_assignments_crash.patch \
> +           file://atftpd.init \
> +          "
> +S =3D "${WORKDIR}/git"
> =20
>  inherit autotools update-rc.d useradd
> =20
> @@ -35,8 +38,3 @@ PACKAGES =3D+ "atftpd"
>  FILES_${PN} =3D "${bindir}/*"
> =20
>  FILES_${PN}d =3D "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
> -
> -SRC_URI[archive.md5sum] =3D "aa269044a6f992eca78fee2f6119643c"
> -SRC_URI[archive.sha256sum] =3D "18815f5b67290fac087c6b9da28dfa5e0feb7220=
96f5c5de52e59b46026da559"
> -SRC_URI[patch.md5sum] =3D "1636f199bf32c754a7bf34a5c647d138"
> -SRC_URI[patch.sha256sum] =3D "0df33f6c09c2b2de58a84d7bb757844fc9538cd4d6=
c8d9c463da5270ebc2e41d"
> diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_t=
ftp_size_restrictions.patch b/meta-oe/recipes-extended/atftp/files/atftpd-0=
=2E7_circumvent_tftp_size_restrictions.patch
> new file mode 100644
> index 0000000..9aeb351
> --- /dev/null
> +++ b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_siz=
e_restrictions.patch
> @@ -0,0 +1,158 @@
> +Fate #303031: Circumvent TFTP size restrictions in atftpd
> +The size of a single image file that can be transferred with TFTP is lim=
ited to
> +2^(2*8) *BLOCKSIZE (as per RFC 1350 there are only two bytes for the blo=
ck
> +counter). This is problematic for one of our customers who needs to tran=
sfer
> +100+ MB Windows images using a TFTP client (NT bootloader) which has a
> +hardwared BLOCKSIZE setting of 1432).
> +
> +block rollover
> +http://www.compuphase.com/tftp.htm
> +
> +Index: git/tftp_def.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tftp_def.h	2012-11-19 16:28:50.221027144 -0800
> ++++ git/tftp_def.h	2012-11-20 17:40:54.391206979 -0800
> +@@ -32,6 +32,7 @@
> + #define TIMEOUT       5         /* Client timeout */
> + #define S_TIMEOUT     5         /* Server timout. */
> + #define NB_OF_RETRY   5
> ++#define MAXBLOCKS   1000000      /* maximum number of blocks in a downl=
oad */
> +=20
> + /* definition to use tftp_options structure */
> + #define OPT_FILENAME  0
> +Index: git/tftp_file.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tftp_file.c	2012-11-19 16:28:50.221027144 -0800
> ++++ git/tftp_file.c	2012-11-19 16:28:51.201027167 -0800
> +@@ -622,8 +622,8 @@
> +      int state =3D S_SEND_REQ;    /* current state in the state machine=
 */
> +      int timeout_state =3D state; /* what state should we go on when ti=
meout */
> +      int result;
> +-     int block_number =3D 0;
> +-     int last_block =3D -1;
> ++     long block_number =3D 0;
> ++     long last_block =3D -1;
> +      int data_size;             /* size of data received */
> +      int sockfd =3D data->sockfd; /* just to simplify calls */
> +      struct sockaddr_storage sa; /* a copy of data.sa_peer */
> +@@ -637,8 +637,8 @@
> +      int convert =3D 0;           /* if true, do netascii convertion */
> +      char string[MAXLEN];
> +=20
> +-     int prev_block_number =3D 0; /* needed to support netascii convert=
ion */
> +-     int prev_file_pos =3D 0;
> ++     long prev_block_number =3D 0; /* needed to support netascii conver=
tion */
> ++     long prev_file_pos =3D 0;
> +      int temp =3D 0;
> +=20
> +      data->file_size =3D 0;
> +@@ -745,7 +745,7 @@
> +                               data_size, data->data_buffer);
> +                data->file_size +=3D data_size;
> +                if (data->trace)
> +-                    fprintf(stderr, "sent DATA <block: %d, size: %d>\n",
> ++                    fprintf(stderr, "sent DATA <block: %ld, size: %d>\n=
",
> +                             block_number + 1, data_size - 4);
> +                state =3D S_WAIT_PACKET;
> +                break;
> +@@ -785,7 +785,7 @@
> +                     }
> +                     block_number =3D ntohs(tftphdr->th_block);
> +                     if (data->trace)
> +-                         fprintf(stderr, "received ACK <block: %d>\n",
> ++                         fprintf(stderr, "received ACK <block: %ld>\n",
> +                                  block_number);
> +                     if ((last_block !=3D -1) && (block_number > last_bl=
ock))
> +                     {
> +Index: git/tftp_io.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tftp_io.c	2012-11-19 16:28:50.221027144 -0800
> ++++ git/tftp_io.c	2012-11-19 16:28:51.201027167 -0800
> +@@ -350,8 +350,8 @@
> + /*
> +  * Read from file and do netascii conversion if needed
> +  */
> +-int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size, i=
nt block_number,
> +-                   int convert, int *prev_block_number, int *prev_file_=
pos, int *temp)
> ++int tftp_file_read(FILE *fp, char *data_buffer, int data_buffer_size, l=
ong block_number,
> ++                   int convert, long *prev_block_number, long *prev_fil=
e_pos, int *temp)
> + {
> +      int i;
> +      int c;
> +Index: git/tftp_io.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tftp_io.h	2012-11-19 16:28:50.221027144 -0800
> ++++ git/tftp_io.h	2012-11-19 16:28:51.201027167 -0800
> +@@ -52,8 +52,8 @@
> + int tftp_get_packet(int sock1, int sock2, int *sock, struct sockaddr_st=
orage *sa,
> +                     struct sockaddr_storage *from, struct sockaddr_stor=
age *to,
> +                     int timeout, int *size, char *data);
> +-int tftp_file_read(FILE *fp, char *buffer, int buffer_size, int block_n=
umber, int convert,
> +-                   int *prev_block_number, int *prev_file_pos, int *tem=
p);
> ++int tftp_file_read(FILE *fp, char *buffer, int buffer_size, long block_=
number, int convert,
> ++                   long *prev_block_number, long *prev_file_pos, int *t=
emp);
> + int tftp_file_write(FILE *fp, char *data_buffer, int data_buffer_size, =
int block_number,
> +                     int data_size, int convert, int *prev_block_number,=
 int *temp);
> + #endif
> +Index: git/tftpd_file.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tftpd_file.c	2012-11-19 16:28:50.225027144 -0800
> ++++ git/tftpd_file.c	2012-11-19 16:28:51.201027167 -0800
> +@@ -407,8 +407,9 @@
> +      int state =3D S_BEGIN;
> +      int timeout_state =3D state;
> +      int result;
> +-     int block_number =3D 0;
> +-     int last_block =3D -1;
> ++     long block_number =3D 0;
> ++     long last_block =3D -1;
> ++     int block_loops =3D 0;
> +      int data_size;
> +      struct sockaddr_storage *sa =3D &data->client_info->client;
> +      struct sockaddr_storage from;
> +@@ -431,8 +432,8 @@
> +      struct client_info *client_old =3D NULL;
> +      struct tftp_opt options[OPT_NUMBER];
> +=20
> +-     int prev_block_number =3D 0; /* needed to support netascii convert=
ion */
> +-     int prev_file_pos =3D 0;
> ++     long prev_block_number =3D 0; /* needed to support netascii conver=
tion */
> ++     long prev_file_pos =3D 0;
> +      int temp =3D 0;
> +=20
> +      /* look for mode option */
> +@@ -565,11 +566,12 @@
> +           logger(LOG_INFO, "blksize option -> %d", result);
> +      }
> +=20
> +-     /* Verify that the file can be sent in 2^16 block of BLKSIZE octet=
s */
> +-     if ((file_stat.st_size / (data->data_buffer_size - 4)) > 65535)
> ++     /* Verify that the file can be sent in MAXBLOCKS blocks of BLKSIZE=
 octets */
> ++     if ((file_stat.st_size / (data->data_buffer_size - 4)) > MAXBLOCKS)
> +      {
> +           tftp_send_error(sockfd, sa, EUNDEF, data->data_buffer, data->=
data_buffer_size);
> +-          logger(LOG_NOTICE, "Requested file to big, increase BLKSIZE");
> ++          logger(LOG_NOTICE, "Requested file too big, increase BLKSIZE"=
);
> ++          logger(LOG_NOTICE, "Only %d blocks of %d bytes can be served.=
", MAXBLOCKS, data->data_buffer_size);
> +           if (data->trace)
> +                logger(LOG_DEBUG, "sent ERROR <code: %d, msg: %s>", EUND=
EF,
> +                       tftp_errmsg[EUNDEF]);
> +@@ -880,10 +882,15 @@
> +                     }
> +                     /* The ACK is from the current client */
> +                     number_of_timeout =3D 0;
> +-                    block_number =3D ntohs(tftphdr->th_block);
> ++                    block_number =3D (block_loops * 65536) + ntohs(tftp=
hdr->th_block);
> +                     if (data->trace)
> +-                         logger(LOG_DEBUG, "received ACK <block: %d>",
> +-                                block_number);
> ++                    {
> ++                         logger(LOG_DEBUG, "received ACK <block: %d>", =
block_number);
> ++                    }
> ++                    if (ntohs(tftphdr->th_block) =3D=3D 65535)
> ++                    {
> ++                         block_loops++;
> ++                    };
> +                     if ((last_block !=3D -1) && (block_number > last_bl=
ock))
> +                     {
> +                          state =3D S_END;
> diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_=
assignments_crash.patch b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_u=
nprotected_assignments_crash.patch
> new file mode 100644
> index 0000000..6faf5f9
> --- /dev/null
> +++ b/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignm=
ents_crash.patch
> @@ -0,0 +1,145 @@
> +Index: git/tftpd_list.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tftpd_list.c	2012-10-24 21:48:47.000000000 -0700
> ++++ git/tftpd_list.c	2012-10-24 21:52:04.266205076 -0700
> +@@ -49,11 +49,11 @@
> +  */
> + int tftpd_list_add(struct thread_data *new)
> + {
> +-     struct thread_data *current =3D thread_data;
> ++     struct thread_data *current;
> +      int ret;
> +=20
> +      pthread_mutex_lock(&thread_list_mutex);
> +-
> ++     current =3D thread_data;
> +      number_of_thread++;
> +     =20
> +      ret =3D number_of_thread;
> +@@ -81,11 +81,13 @@
> +  */
> + int tftpd_list_remove(struct thread_data *old)
> + {
> +-     struct thread_data *current =3D thread_data;
> ++     struct thread_data *current;
> +      int ret;
> +=20
> +      pthread_mutex_lock(&thread_list_mutex);
> +=20
> ++     current =3D thread_data;
> ++
> +      number_of_thread--;
> +      ret =3D number_of_thread;
> +    =20
> +@@ -137,23 +139,26 @@
> +                                              struct thread_data *data,
> +                                              struct client_info *client)
> + {
> +-     struct thread_data *current =3D thread_data; /* head of the list */
> +-     struct tftp_opt *tftp_options =3D data->tftp_options;
> ++     struct thread_data *current; /* head of the list */
> ++     struct tftp_opt *tftp_options;
> +      struct client_info *tmp;
> +      char options[MAXLEN];
> +      char string[MAXLEN];
> +      char *index;
> +      int len;
> +=20
> ++     /* lock the whole list before walking it */
> ++     pthread_mutex_lock(&thread_list_mutex);
> ++
> +      *thread =3D NULL;
> +=20
> ++     current =3D thread_data;
> ++     tftp_options =3D data->tftp_options;
> ++
> +      opt_request_to_string(tftp_options, options, MAXLEN);
> +      index =3D strstr(options, "multicast");
> +      len =3D (int)index - (int)options;
> +=20
> +-     /* lock the whole list before walking it */
> +-     pthread_mutex_lock(&thread_list_mutex);
> +-
> +      while (current)
> +      {
> +           if (current !=3D data)
> +@@ -214,9 +219,10 @@
> + void tftpd_clientlist_remove(struct thread_data *thread,
> +                              struct client_info *client)
> + {
> +-     struct client_info *tmp =3D thread->client_info;
> ++     struct client_info *tmp;
> +=20
> +      pthread_mutex_lock(&thread->client_mutex);
> ++     tmp =3D thread->client_info;
> +      while ((tmp->next !=3D client) && (tmp->next !=3D NULL))
> +           tmp =3D tmp->next;
> +      if (tmp->next =3D=3D NULL)
> +@@ -231,9 +237,11 @@
> + void tftpd_clientlist_free(struct thread_data *thread)
> + {
> +      struct client_info *tmp;
> +-     struct client_info *head =3D thread->client_info;
> ++     struct client_info *head;
> +=20
> +      pthread_mutex_lock(&thread->client_mutex);
> ++     head =3D thread->client_info;
> ++
> +      while (head)
> +      {
> +           tmp =3D head;
> +@@ -250,9 +258,10 @@
> +                           struct client_info *client,
> +                           struct sockaddr_storage *sock)
> + {
> +-     struct client_info *head =3D thread->client_info;
> ++     struct client_info *head;
> +=20
> +      pthread_mutex_lock(&thread->client_mutex);
> ++     head =3D thread->client_info;
> +=20
> +      if (client)
> +      {
> +@@ -334,10 +343,10 @@
> +=20
> + void tftpd_list_kill_threads(void)
> + {
> +-     struct thread_data *current =3D thread_data; /* head of list */
> ++     struct thread_data *current; /* head of list */
> +=20
> +      pthread_mutex_lock(&thread_list_mutex);
> +-
> ++     current =3D thread_data;
> +=20
> +      while (current !=3D NULL)
> +      {
> +Index: git/tftpd_mcast.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/tftpd_mcast.c	2012-10-24 21:48:47.000000000 -0700
> ++++ git/tftpd_mcast.c	2012-10-24 21:49:11.570201582 -0700
> +@@ -51,9 +51,11 @@
> +  */
> + int tftpd_mcast_get_tid(char **addr, short *port)
> + {
> +-     struct tid *current =3D tid_list;
> ++     struct tid *current;
> +=20
> +      pthread_mutex_lock(&mcast_tid_list);
> ++     current =3D tid_list;
> ++
> +      /* walk the list for a free tid */
> +      while (current !=3D NULL)
> +      {
> +@@ -74,9 +76,11 @@
> +=20
> + int tftpd_mcast_free_tid(char *addr, short port)
> + {
> +-     struct tid *current =3D tid_list;
> ++     struct tid *current;
> +=20
> +      pthread_mutex_lock(&mcast_tid_list);
> ++     current =3D tid_list;
> ++
> +      while (current !=3D NULL)
> +      {
> + 	  if ((current->used =3D=3D 1) && (current->port =3D=3D port) &&
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpRaMACgkQN1Ujt2V2gBxcuwCglc5tHSEJ1tszJ6pwsmomPYot
XFUAn1dzsXVXmUtPzvmlQ3zHgcIo15Jc
=JMjG
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
