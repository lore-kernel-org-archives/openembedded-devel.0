Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 76593609B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 12:17:00 +0000 (UTC)
Received: by wgv5 with SMTP id 5so101824780wgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=AmNrxKaM6oGTjt0rJq/R2YajCGJ9iHZSAfxAJlfZggc=;
	b=xK41u3nUMO9MX40neV1y81r7sGAVghjJYqKa2hpF/QvRkdv+KVPhar7niV/zL6R9cM
	Va+L+A/Aq1o7wa+RHkQo02CbeeaPltST47oZjvjioKzOFLrItiKN+9x88nJHw1xP8+n3
	E1WWuwgqN2CthXoAlFcEvnfSb2ARIQteqp2IX2R6a/zJpqShFTS0VomusKyTwAAlLL5/
	IDFlVTmqlGmpQdyUDSu5qpXvJM01554ajteavOSPUjRoAHAeQthBc8WPHE6rEBXVJRrT
	6Hy6CDCH/o19pr4FyAU9owbksMsYOJoBE8FpM0bdkowBiWaI3l4CkC5pEOugLo4ckhbD
	JaSA==
X-Received: by 10.194.62.228 with SMTP id b4mr31291447wjs.2.1433765820835;
	Mon, 08 Jun 2015 05:17:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ha4sm767067wib.0.2015.06.08.05.16.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jun 2015 05:16:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Jun 2015 14:17:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150608121705.GA2384@jama>
References: <1433474180-29988-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1433474180-29988-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe] postgresql: upgrade to 9.4.2
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
X-List-Received-Date: Mon, 08 Jun 2015 12:17:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2015 at 11:16:20AM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. remove Backport patches
> 2. Update the checksume, include CopyRight file, since date in it
> is changed
> 3. remove --without-krb5 configure options, since it become useless
> 4. Update remove.autoconf.version.check.patch

Failed to build in world:
http://errors.yoctoproject.org/Errors/Details/12127/

>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  ...integer-overflow-to-avoid-buffer-overruns.patch |  605 -----------
>  .../0003-Shore-up-ADMIN-OPTION-restrictions.patch  |  273 -----
>  ...vilege-escalation-in-explicit-calls-to-PL.patch |  267 -----
>  ...ted-name-lookups-during-table-and-index-D.patch | 1082 --------------=
------
>  ...ix-handling-of-wide-datetime-input-output.patch |  465 ---------
>  ...al-available-to-pg_regress-of-ECPG-and-is.patch |   75 --
>  ...-potential-overruns-of-fixed-size-buffers.patch |  393 -------
>  .../ecpg-parallel-make-fix.patch                   |    0
>  .../remove.autoconf.version.check.patch            |    7 +-
>  meta-oe/recipes-support/postgresql/postgresql.inc  |    8 -
>  .../recipes-support/postgresql/postgresql_9.2.4.bb |   13 -
>  .../recipes-support/postgresql/postgresql_9.4.2.bb |   12 +
>  12 files changed, 16 insertions(+), 3184 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/postgresql/files/0002-Predict=
-integer-overflow-to-avoid-buffer-overruns.patch
>  delete mode 100644 meta-oe/recipes-support/postgresql/files/0003-Shore-u=
p-ADMIN-OPTION-restrictions.patch
>  delete mode 100644 meta-oe/recipes-support/postgresql/files/0004-Prevent=
-privilege-escalation-in-explicit-calls-to-PL.patch
>  delete mode 100644 meta-oe/recipes-support/postgresql/files/0005-Avoid-r=
epeated-name-lookups-during-table-and-index-D.patch
>  delete mode 100644 meta-oe/recipes-support/postgresql/files/0006-Fix-han=
dling-of-wide-datetime-input-output.patch
>  delete mode 100644 meta-oe/recipes-support/postgresql/files/0007-Make-pq=
signal-available-to-pg_regress-of-ECPG-and-is.patch
>  delete mode 100644 meta-oe/recipes-support/postgresql/files/0008-Prevent=
-potential-overruns-of-fixed-size-buffers.patch
>  rename meta-oe/recipes-support/postgresql/{postgresql-9.2.4 =3D> postgre=
sql-9.4.2}/ecpg-parallel-make-fix.patch (100%)
>  rename meta-oe/recipes-support/postgresql/{postgresql-9.2.4 =3D> postgre=
sql-9.4.2}/remove.autoconf.version.check.patch (71%)
>  delete mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
>  create mode 100644 meta-oe/recipes-support/postgresql/postgresql_9.4.2.bb
>=20
> diff --git a/meta-oe/recipes-support/postgresql/files/0002-Predict-intege=
r-overflow-to-avoid-buffer-overruns.patch b/meta-oe/recipes-support/postgre=
sql/files/0002-Predict-integer-overflow-to-avoid-buffer-overruns.patch
> deleted file mode 100644
> index c8b4c80..0000000
> --- a/meta-oe/recipes-support/postgresql/files/0002-Predict-integer-overf=
low-to-avoid-buffer-overruns.patch
> +++ /dev/null
> @@ -1,605 +0,0 @@
> -From 12bbce15d93d7692ddff1405aa04b67f8a327f57 Mon Sep 17 00:00:00 2001
> -From: Noah Misch <noah@leadboat.com>
> -Date: Mon, 17 Feb 2014 09:33:31 -0500
> -Subject: [PATCH] Predict integer overflow to avoid buffer overruns.
> -
> -commit 12bbce15d93d7692ddff1405aa04b67f8a327f57 REL9_2_STABLE
> -
> -Several functions, mostly type input functions, calculated an allocation
> -size such that the calculation wrapped to a small positive value when
> -arguments implied a sufficiently-large requirement.  Writes past the end
> -of the inadvertent small allocation followed shortly thereafter.
> -Coverity identified the path_in() vulnerability; code inspection led to
> -the rest.  In passing, add check_stack_depth() to prevent stack overflow
> -in related functions.
> -
> -Back-patch to 8.4 (all supported versions).  The non-comment hstore
> -changes touch code that did not exist in 8.4, so that part stops at 9.0.
> -
> -Noah Misch and Heikki Linnakangas, reviewed by Tom Lane.
> -
> -Security: CVE-2014-0064
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - contrib/hstore/hstore.h              |   15 ++++++++++++---
> - contrib/hstore/hstore_io.c           |   21 +++++++++++++++++++++
> - contrib/hstore/hstore_op.c           |   15 +++++++++++++++
> - contrib/intarray/_int.h              |    2 ++
> - contrib/intarray/_int_bool.c         |    9 +++++++++
> - contrib/ltree/ltree.h                |    3 +++
> - contrib/ltree/ltree_io.c             |   11 +++++++++++
> - contrib/ltree/ltxtquery_io.c         |   13 ++++++++++++-
> - src/backend/utils/adt/geo_ops.c      |   30 +++++++++++++++++++++++++++=
+--
> - src/backend/utils/adt/tsquery.c      |    7 ++++++-
> - src/backend/utils/adt/tsquery_util.c |    5 +++++
> - src/backend/utils/adt/txid.c         |   15 +++++----------
> - src/backend/utils/adt/varbit.c       |   32 +++++++++++++++++++++++++++=
+++--
> - src/include/tsearch/ts_type.h        |    3 +++
> - src/include/utils/varbit.h           |    7 +++++++
> - 15 files changed, 169 insertions(+), 19 deletions(-)
> -
> -diff --git a/contrib/hstore/hstore.h b/contrib/hstore/hstore.h
> -index 8906397..4e55f6e 100644
> ---- a/contrib/hstore/hstore.h
> -+++ b/contrib/hstore/hstore.h
> -@@ -49,9 +49,12 @@ typedef struct
> - } HStore;
> -=20
> - /*
> -- * it's not possible to get more than 2^28 items into an hstore,
> -- * so we reserve the top few bits of the size field. See hstore_compat.c
> -- * for one reason why.	Some bits are left for future use here.
> -+ * It's not possible to get more than 2^28 items into an hstore, so we =
reserve
> -+ * the top few bits of the size field.  See hstore_compat.c for one rea=
son
> -+ * why.  Some bits are left for future use here.  MaxAllocSize makes the
> -+ * practical count limit slightly more than 2^28 / 3, or INT_MAX / 24, =
the
> -+ * limit for an hstore full of 4-byte keys and null values.  Therefore,=
 we
> -+ * don't explicitly check the format-imposed limit.
> -  */
> - #define HS_FLAG_NEWVERSION 0x80000000
> -=20
> -@@ -59,6 +62,12 @@ typedef struct
> - #define HS_SETCOUNT(hsp_,c_) ((hsp_)->size_ =3D (c_) | HS_FLAG_NEWVERSI=
ON)
> -=20
> -=20
> -+/*
> -+ * "x" comes from an existing HS_COUNT() (as discussed, <=3D INT_MAX/24=
) or a
> -+ * Pairs array length (due to MaxAllocSize, <=3D INT_MAX/40).  "lenstr"=
 is no
> -+ * more than INT_MAX, that extreme case arising in hstore_from_arrays().
> -+ * Therefore, this calculation is limited to about INT_MAX / 5 + INT_MA=
X.
> -+ */
> - #define HSHRDSIZE	(sizeof(HStore))
> - #define CALCDATASIZE(x, lenstr) ( (x) * 2 * sizeof(HEntry) + HSHRDSIZE =
+ (lenstr) )
> -=20
> -diff --git a/contrib/hstore/hstore_io.c b/contrib/hstore/hstore_io.c
> -index dde6c4b..5bcdc95 100644
> ---- a/contrib/hstore/hstore_io.c
> -+++ b/contrib/hstore/hstore_io.c
> -@@ -9,6 +9,7 @@
> - #include "funcapi.h"
> - #include "libpq/pqformat.h"
> - #include "utils/lsyscache.h"
> -+#include "utils/memutils.h"
> - #include "utils/typcache.h"
> -=20
> - #include "hstore.h"
> -@@ -437,6 +438,11 @@ hstore_recv(PG_FUNCTION_ARGS)
> - 		PG_RETURN_POINTER(out);
> - 	}
> -=20
> -+	if (pcount < 0 || pcount > MaxAllocSize / sizeof(Pairs))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+			  errmsg("number of pairs (%d) exceeds the maximum allowed (%d)",
> -+					 pcount, (int) (MaxAllocSize / sizeof(Pairs)))));
> - 	pairs =3D palloc(pcount * sizeof(Pairs));
> -=20
> - 	for (i =3D 0; i < pcount; ++i)
> -@@ -552,6 +558,13 @@ hstore_from_arrays(PG_FUNCTION_ARGS)
> - 					  TEXTOID, -1, false, 'i',
> - 					  &key_datums, &key_nulls, &key_count);
> -=20
> -+	/* see discussion in hstoreArrayToPairs() */
> -+	if (key_count > MaxAllocSize / sizeof(Pairs))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+			  errmsg("number of pairs (%d) exceeds the maximum allowed (%d)",
> -+					 key_count, (int) (MaxAllocSize / sizeof(Pairs)))));
> -+
> - 	/* value_array might be NULL */
> -=20
> - 	if (PG_ARGISNULL(1))
> -@@ -674,6 +687,13 @@ hstore_from_array(PG_FUNCTION_ARGS)
> -=20
> - 	count =3D in_count / 2;
> -=20
> -+	/* see discussion in hstoreArrayToPairs() */
> -+	if (count > MaxAllocSize / sizeof(Pairs))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+			  errmsg("number of pairs (%d) exceeds the maximum allowed (%d)",
> -+					 count, (int) (MaxAllocSize / sizeof(Pairs)))));
> -+
> - 	pairs =3D palloc(count * sizeof(Pairs));
> -=20
> - 	for (i =3D 0; i < count; ++i)
> -@@ -805,6 +825,7 @@ hstore_from_record(PG_FUNCTION_ARGS)
> - 		my_extra->ncolumns =3D ncolumns;
> - 	}
> -=20
> -+	Assert(ncolumns <=3D MaxTupleAttributeNumber);		/* thus, no overflow */
> - 	pairs =3D palloc(ncolumns * sizeof(Pairs));
> -=20
> - 	if (rec)
> -diff --git a/contrib/hstore/hstore_op.c b/contrib/hstore/hstore_op.c
> -index fee2c3c..8de175a 100644
> ---- a/contrib/hstore/hstore_op.c
> -+++ b/contrib/hstore/hstore_op.c
> -@@ -7,6 +7,7 @@
> - #include "catalog/pg_type.h"
> - #include "funcapi.h"
> - #include "utils/builtins.h"
> -+#include "utils/memutils.h"
> -=20
> - #include "hstore.h"
> -=20
> -@@ -89,6 +90,19 @@ hstoreArrayToPairs(ArrayType *a, int *npairs)
> - 		return NULL;
> - 	}
> -=20
> -+	/*
> -+	 * A text array uses at least eight bytes per element, so any overflow=
 in
> -+	 * "key_count * sizeof(Pairs)" is small enough for palloc() to catch.
> -+	 * However, credible improvements to the array format could invalidate
> -+	 * that assumption.  Therefore, use an explicit check rather than rely=
ing
> -+	 * on palloc() to complain.
> -+	 */
> -+	if (key_count > MaxAllocSize / sizeof(Pairs))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+			  errmsg("number of pairs (%d) exceeds the maximum allowed (%d)",
> -+					 key_count, (int) (MaxAllocSize / sizeof(Pairs)))));
> -+
> - 	key_pairs =3D palloc(sizeof(Pairs) * key_count);
> -=20
> - 	for (i =3D 0, j =3D 0; i < key_count; i++)
> -@@ -647,6 +661,7 @@ hstore_slice_to_hstore(PG_FUNCTION_ARGS)
> - 		PG_RETURN_POINTER(out);
> - 	}
> -=20
> -+	/* hstoreArrayToPairs() checked overflow */
> - 	out_pairs =3D palloc(sizeof(Pairs) * nkeys);
> - 	bufsiz =3D 0;
> -=20
> -diff --git a/contrib/intarray/_int.h b/contrib/intarray/_int.h
> -index 11c0698..755cd9e 100644
> ---- a/contrib/intarray/_int.h
> -+++ b/contrib/intarray/_int.h
> -@@ -5,6 +5,7 @@
> - #define ___INT_H__
> -=20
> - #include "utils/array.h"
> -+#include "utils/memutils.h"
> -=20
> - /* number ranges for compression */
> - #define MAXNUMRANGE 100
> -@@ -137,6 +138,7 @@ typedef struct QUERYTYPE
> -=20
> - #define HDRSIZEQT	offsetof(QUERYTYPE, items)
> - #define COMPUTESIZE(size)	( HDRSIZEQT + (size) * sizeof(ITEM) )
> -+#define QUERYTYPEMAXITEMS	((MaxAllocSize - HDRSIZEQT) / sizeof(ITEM))
> - #define GETQUERY(x)  ( (x)->items )
> -=20
> - /* "type" codes for ITEM */
> -diff --git a/contrib/intarray/_int_bool.c b/contrib/intarray/_int_bool.c
> -index 4e63f6d..62294d1 100644
> ---- a/contrib/intarray/_int_bool.c
> -+++ b/contrib/intarray/_int_bool.c
> -@@ -451,6 +451,9 @@ boolop(PG_FUNCTION_ARGS)
> - static void
> - findoprnd(ITEM *ptr, int4 *pos)
> - {
> -+	/* since this function recurses, it could be driven to stack overflow.=
 */
> -+	check_stack_depth();
> -+
> - #ifdef BS_DEBUG
> - 	elog(DEBUG3, (ptr[*pos].type =3D=3D OPR) ?
> - 		 "%d  %c" : "%d  %d", *pos, ptr[*pos].val);
> -@@ -511,7 +514,13 @@ bqarr_in(PG_FUNCTION_ARGS)
> - 				(errcode(ERRCODE_INVALID_PARAMETER_VALUE),
> - 				 errmsg("empty query")));
> -=20
> -+	if (state.num > QUERYTYPEMAXITEMS)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+		errmsg("number of query items (%d) exceeds the maximum allowed (%d)",
> -+			   state.num, (int) QUERYTYPEMAXITEMS)));
> - 	commonlen =3D COMPUTESIZE(state.num);
> -+
> - 	query =3D (QUERYTYPE *) palloc(commonlen);
> - 	SET_VARSIZE(query, commonlen);
> - 	query->size =3D state.num;
> -diff --git a/contrib/ltree/ltree.h b/contrib/ltree/ltree.h
> -index aec4458..49e9907 100644
> ---- a/contrib/ltree/ltree.h
> -+++ b/contrib/ltree/ltree.h
> -@@ -5,6 +5,7 @@
> -=20
> - #include "fmgr.h"
> - #include "tsearch/ts_locale.h"
> -+#include "utils/memutils.h"
> -=20
> - typedef struct
> - {
> -@@ -111,6 +112,8 @@ typedef struct
> -=20
> - #define HDRSIZEQT		MAXALIGN(VARHDRSZ + sizeof(int4))
> - #define COMPUTESIZE(size,lenofoperand)	( HDRSIZEQT + (size) * sizeof(IT=
EM) + (lenofoperand) )
> -+#define LTXTQUERY_TOO_BIG(size,lenofoperand) \
> -+	((size) > (MaxAllocSize - HDRSIZEQT - (lenofoperand)) / sizeof(ITEM))
> - #define GETQUERY(x)  (ITEM*)( (char*)(x)+HDRSIZEQT )
> - #define GETOPERAND(x)	( (char*)GETQUERY(x) + ((ltxtquery*)x)->size * si=
zeof(ITEM) )
> -=20
> -diff --git a/contrib/ltree/ltree_io.c b/contrib/ltree/ltree_io.c
> -index 3e88b81..d64debb 100644
> ---- a/contrib/ltree/ltree_io.c
> -+++ b/contrib/ltree/ltree_io.c
> -@@ -8,6 +8,7 @@
> - #include <ctype.h>
> -=20
> - #include "ltree.h"
> -+#include "utils/memutils.h"
> - #include "crc32.h"
> -=20
> - PG_FUNCTION_INFO_V1(ltree_in);
> -@@ -64,6 +65,11 @@ ltree_in(PG_FUNCTION_ARGS)
> - 		ptr +=3D charlen;
> - 	}
> -=20
> -+	if (num + 1 > MaxAllocSize / sizeof(nodeitem))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+			 errmsg("number of levels (%d) exceeds the maximum allowed (%d)",
> -+					num + 1, (int) (MaxAllocSize / sizeof(nodeitem)))));
> - 	list =3D lptr =3D (nodeitem *) palloc(sizeof(nodeitem) * (num + 1));
> - 	ptr =3D buf;
> - 	while (*ptr)
> -@@ -228,6 +234,11 @@ lquery_in(PG_FUNCTION_ARGS)
> - 	}
> -=20
> - 	num++;
> -+	if (num > MaxAllocSize / ITEMSIZE)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+			 errmsg("number of levels (%d) exceeds the maximum allowed (%d)",
> -+					num, (int) (MaxAllocSize / ITEMSIZE))));
> - 	curqlevel =3D tmpql =3D (lquery_level *) palloc0(ITEMSIZE * num);
> - 	ptr =3D buf;
> - 	while (*ptr)
> -diff --git a/contrib/ltree/ltxtquery_io.c b/contrib/ltree/ltxtquery_io.c
> -index 826f4e1..13ea58d 100644
> ---- a/contrib/ltree/ltxtquery_io.c
> -+++ b/contrib/ltree/ltxtquery_io.c
> -@@ -9,6 +9,7 @@
> -=20
> - #include "crc32.h"
> - #include "ltree.h"
> -+#include "miscadmin.h"
> -=20
> - PG_FUNCTION_INFO_V1(ltxtq_in);
> - Datum		ltxtq_in(PG_FUNCTION_ARGS);
> -@@ -213,6 +214,9 @@ makepol(QPRS_STATE *state)
> - 	int4		lenstack =3D 0;
> - 	uint16		flag =3D 0;
> -=20
> -+	/* since this function recurses, it could be driven to stack overflow =
*/
> -+	check_stack_depth();
> -+
> - 	while ((type =3D gettoken_query(state, &val, &lenval, &strval, &flag))=
 !=3D END)
> - 	{
> - 		switch (type)
> -@@ -277,6 +281,9 @@ makepol(QPRS_STATE *state)
> - static void
> - findoprnd(ITEM *ptr, int4 *pos)
> - {
> -+	/* since this function recurses, it could be driven to stack overflow.=
 */
> -+	check_stack_depth();
> -+
> - 	if (ptr[*pos].type =3D=3D VAL || ptr[*pos].type =3D=3D VALTRUE)
> - 	{
> - 		ptr[*pos].left =3D 0;
> -@@ -341,8 +348,12 @@ queryin(char *buf)
> - 				 errmsg("syntax error"),
> - 				 errdetail("Empty query.")));
> -=20
> --	/* make finish struct */
> -+	if (LTXTQUERY_TOO_BIG(state.num, state.sumlen))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("ltxtquery is too large")));
> - 	commonlen =3D COMPUTESIZE(state.num, state.sumlen);
> -+
> - 	query =3D (ltxtquery *) palloc(commonlen);
> - 	SET_VARSIZE(query, commonlen);
> - 	query->size =3D state.num;
> -diff --git a/src/backend/utils/adt/geo_ops.c b/src/backend/utils/adt/geo=
_ops.c
> -index ac7b4b8..7ebcaaa 100644
> ---- a/src/backend/utils/adt/geo_ops.c
> -+++ b/src/backend/utils/adt/geo_ops.c
> -@@ -1403,6 +1403,7 @@ path_in(PG_FUNCTION_ARGS)
> - 	char	   *s;
> - 	int			npts;
> - 	int			size;
> -+	int			base_size;
> - 	int			depth =3D 0;
> -=20
> - 	if ((npts =3D pair_count(str, ',')) <=3D 0)
> -@@ -1421,7 +1422,15 @@ path_in(PG_FUNCTION_ARGS)
> - 		depth++;
> - 	}
> -=20
> --	size =3D offsetof(PATH, p[0]) +sizeof(path->p[0]) * npts;
> -+	base_size =3D sizeof(path->p[0]) * npts;
> -+	size =3D offsetof(PATH, p[0]) + base_size;
> -+
> -+	/* Check for integer overflow */
> -+	if (base_size / npts !=3D sizeof(path->p[0]) || size <=3D base_size)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("too many points requested")));
> -+
> - 	path =3D (PATH *) palloc(size);
> -=20
> - 	SET_VARSIZE(path, size);
> -@@ -3465,6 +3474,7 @@ poly_in(PG_FUNCTION_ARGS)
> - 	POLYGON    *poly;
> - 	int			npts;
> - 	int			size;
> -+	int			base_size;
> - 	int			isopen;
> - 	char	   *s;
> -=20
> -@@ -3473,7 +3483,15 @@ poly_in(PG_FUNCTION_ARGS)
> - 				(errcode(ERRCODE_INVALID_TEXT_REPRESENTATION),
> - 			  errmsg("invalid input syntax for type polygon: \"%s\"", str)));
> -=20
> --	size =3D offsetof(POLYGON, p[0]) +sizeof(poly->p[0]) * npts;
> -+	base_size =3D sizeof(poly->p[0]) * npts;
> -+	size =3D offsetof(POLYGON, p[0]) + base_size;
> -+
> -+	/* Check for integer overflow */
> -+	if (base_size / npts !=3D sizeof(poly->p[0]) || size <=3D base_size)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("too many points requested")));
> -+
> - 	poly =3D (POLYGON *) palloc0(size);	/* zero any holes */
> -=20
> - 	SET_VARSIZE(poly, size);
> -@@ -4379,6 +4397,10 @@ path_poly(PG_FUNCTION_ARGS)
> - 				(errcode(ERRCODE_INVALID_PARAMETER_VALUE),
> - 				 errmsg("open path cannot be converted to polygon")));
> -=20
> -+	/*
> -+	 * Never overflows: the old size fit in MaxAllocSize, and the new size=
 is
> -+	 * just a small constant larger.
> -+	 */
> - 	size =3D offsetof(POLYGON, p[0]) +sizeof(poly->p[0]) * path->npts;
> - 	poly =3D (POLYGON *) palloc(size);
> -=20
> -@@ -4484,6 +4506,10 @@ poly_path(PG_FUNCTION_ARGS)
> - 	int			size;
> - 	int			i;
> -=20
> -+	/*
> -+	 * Never overflows: the old size fit in MaxAllocSize, and the new size=
 is
> -+	 * smaller by a small constant.
> -+	 */
> - 	size =3D offsetof(PATH, p[0]) +sizeof(path->p[0]) * poly->npts;
> - 	path =3D (PATH *) palloc(size);
> -=20
> -diff --git a/src/backend/utils/adt/tsquery.c b/src/backend/utils/adt/tsq=
uery.c
> -index 6e1f8cf..1322b5e 100644
> ---- a/src/backend/utils/adt/tsquery.c
> -+++ b/src/backend/utils/adt/tsquery.c
> -@@ -515,8 +515,13 @@ parse_tsquery(char *buf,
> - 		return query;
> - 	}
> -=20
> --	/* Pack the QueryItems in the final TSQuery struct to return to caller=
 */
> -+	if (TSQUERY_TOO_BIG(list_length(state.polstr), state.sumlen))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("tsquery is too large")));
> - 	commonlen =3D COMPUTESIZE(list_length(state.polstr), state.sumlen);
> -+
> -+	/* Pack the QueryItems in the final TSQuery struct to return to caller=
 */
> - 	query =3D (TSQuery) palloc0(commonlen);
> - 	SET_VARSIZE(query, commonlen);
> - 	query->size =3D list_length(state.polstr);
> -diff --git a/src/backend/utils/adt/tsquery_util.c b/src/backend/utils/ad=
t/tsquery_util.c
> -index 0724d33..9003702 100644
> ---- a/src/backend/utils/adt/tsquery_util.c
> -+++ b/src/backend/utils/adt/tsquery_util.c
> -@@ -333,6 +333,11 @@ QTN2QT(QTNode *in)
> - 	QTN2QTState state;
> -=20
> - 	cntsize(in, &sumlen, &nnode);
> -+
> -+	if (TSQUERY_TOO_BIG(nnode, sumlen))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("tsquery is too large")));
> - 	len =3D COMPUTESIZE(nnode, sumlen);
> -=20
> - 	out =3D (TSQuery) palloc0(len);
> -diff --git a/src/backend/utils/adt/txid.c b/src/backend/utils/adt/txid.c
> -index 08a8c89..c71daaf 100644
> ---- a/src/backend/utils/adt/txid.c
> -+++ b/src/backend/utils/adt/txid.c
> -@@ -27,6 +27,7 @@
> - #include "miscadmin.h"
> - #include "libpq/pqformat.h"
> - #include "utils/builtins.h"
> -+#include "utils/memutils.h"
> - #include "utils/snapmgr.h"
> -=20
> -=20
> -@@ -66,6 +67,8 @@ typedef struct
> -=20
> - #define TXID_SNAPSHOT_SIZE(nxip) \
> - 	(offsetof(TxidSnapshot, xip) + sizeof(txid) * (nxip))
> -+#define TXID_SNAPSHOT_MAX_NXIP \
> -+	((MaxAllocSize - offsetof(TxidSnapshot, xip)) / sizeof(txid))
> -=20
> - /*
> -  * Epoch values from xact.c
> -@@ -445,20 +448,12 @@ txid_snapshot_recv(PG_FUNCTION_ARGS)
> - 	txid		last =3D 0;
> - 	int			nxip;
> - 	int			i;
> --	int			avail;
> --	int			expect;
> - 	txid		xmin,
> - 				xmax;
> -=20
> --	/*
> --	 * load nxip and check for nonsense.
> --	 *
> --	 * (nxip > avail) check is against int overflows in 'expect'.
> --	 */
> -+	/* load and validate nxip */
> - 	nxip =3D pq_getmsgint(buf, 4);
> --	avail =3D buf->len - buf->cursor;
> --	expect =3D 8 + 8 + nxip * 8;
> --	if (nxip < 0 || nxip > avail || expect > avail)
> -+	if (nxip < 0 || nxip > TXID_SNAPSHOT_MAX_NXIP)
> - 		goto bad_format;
> -=20
> - 	xmin =3D pq_getmsgint64(buf);
> -diff --git a/src/backend/utils/adt/varbit.c b/src/backend/utils/adt/varb=
it.c
> -index 2bcf5b8..0deefda 100644
> ---- a/src/backend/utils/adt/varbit.c
> -+++ b/src/backend/utils/adt/varbit.c
> -@@ -148,12 +148,22 @@ bit_in(PG_FUNCTION_ARGS)
> - 		sp =3D input_string;
> - 	}
> -=20
> -+	/*
> -+	 * Determine bitlength from input string.  MaxAllocSize ensures a regu=
lar
> -+	 * input is small enough, but we must check hex input.
> -+	 */
> - 	slen =3D strlen(sp);
> --	/* Determine bitlength from input string */
> - 	if (bit_not_hex)
> - 		bitlen =3D slen;
> - 	else
> -+	{
> -+		if (slen > VARBITMAXLEN / 4)
> -+			ereport(ERROR,
> -+					(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("bit string length exceeds the maximum allowed (%d)",
> -+						VARBITMAXLEN)));
> - 		bitlen =3D slen * 4;
> -+	}
> -=20
> - 	/*
> - 	 * Sometimes atttypmod is not supplied. If it is supplied we need to m=
ake
> -@@ -450,12 +460,22 @@ varbit_in(PG_FUNCTION_ARGS)
> - 		sp =3D input_string;
> - 	}
> -=20
> -+	/*
> -+	 * Determine bitlength from input string.  MaxAllocSize ensures a regu=
lar
> -+	 * input is small enough, but we must check hex input.
> -+	 */
> - 	slen =3D strlen(sp);
> --	/* Determine bitlength from input string */
> - 	if (bit_not_hex)
> - 		bitlen =3D slen;
> - 	else
> -+	{
> -+		if (slen > VARBITMAXLEN / 4)
> -+			ereport(ERROR,
> -+					(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("bit string length exceeds the maximum allowed (%d)",
> -+						VARBITMAXLEN)));
> - 		bitlen =3D slen * 4;
> -+	}
> -=20
> - 	/*
> - 	 * Sometimes atttypmod is not supplied. If it is supplied we need to m=
ake
> -@@ -535,6 +555,9 @@ varbit_in(PG_FUNCTION_ARGS)
> - /*
> -  * varbit_out -
> -  *	  Prints the string as bits to preserve length accurately
> -+ *
> -+ * XXX varbit_recv() and hex input to varbit_in() can load a value that=
 this
> -+ * cannot emit.  Consider using hex output for such values.
> -  */
> - Datum
> - varbit_out(PG_FUNCTION_ARGS)
> -@@ -944,6 +967,11 @@ bit_catenate(VarBit *arg1, VarBit *arg2)
> - 	bitlen1 =3D VARBITLEN(arg1);
> - 	bitlen2 =3D VARBITLEN(arg2);
> -=20
> -+	if (bitlen1 > VARBITMAXLEN - bitlen2)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
> -+				 errmsg("bit string length exceeds the maximum allowed (%d)",
> -+						VARBITMAXLEN)));
> - 	bytelen =3D VARBITTOTALLEN(bitlen1 + bitlen2);
> -=20
> - 	result =3D (VarBit *) palloc(bytelen);
> -diff --git a/src/include/tsearch/ts_type.h b/src/include/tsearch/ts_type=
=2Eh
> -index 3adc336..9ee5610 100644
> ---- a/src/include/tsearch/ts_type.h
> -+++ b/src/include/tsearch/ts_type.h
> -@@ -13,6 +13,7 @@
> - #define _PG_TSTYPE_H_
> -=20
> - #include "fmgr.h"
> -+#include "utils/memutils.h"
> - #include "utils/pg_crc.h"
> -=20
> -=20
> -@@ -244,6 +245,8 @@ typedef TSQueryData *TSQuery;
> -  * QueryItems, and lenofoperand is the total length of all operands
> -  */
> - #define COMPUTESIZE(size, lenofoperand) ( HDRSIZETQ + (size) * sizeof(Q=
ueryItem) + (lenofoperand) )
> -+#define TSQUERY_TOO_BIG(size, lenofoperand) \
> -+	((size) > (MaxAllocSize - HDRSIZETQ - (lenofoperand)) / sizeof(QueryIt=
em))
> -=20
> - /* Returns a pointer to the first QueryItem in a TSQuery */
> - #define GETQUERY(x)  ((QueryItem*)( (char*)(x)+HDRSIZETQ ))
> -diff --git a/src/include/utils/varbit.h b/src/include/utils/varbit.h
> -index 52dca8b..61531a8 100644
> ---- a/src/include/utils/varbit.h
> -+++ b/src/include/utils/varbit.h
> -@@ -15,6 +15,8 @@
> - #ifndef VARBIT_H
> - #define VARBIT_H
> -=20
> -+#include <limits.h>
> -+
> - #include "fmgr.h"
> -=20
> - /*
> -@@ -53,6 +55,11 @@ typedef struct
> - /* Number of bytes needed to store a bit string of a given length */
> - #define VARBITTOTALLEN(BITLEN)	(((BITLEN) + BITS_PER_BYTE-1)/BITS_PER_B=
YTE + \
> - 								 VARHDRSZ + VARBITHDRSZ)
> -+/*
> -+ * Maximum number of bits.  Several code sites assume no overflow from
> -+ * computing bitlen + X; VARBITTOTALLEN() has the largest such X.
> -+ */
> -+#define VARBITMAXLEN		(INT_MAX - BITS_PER_BYTE + 1)
> - /* pointer beyond the end of the bit string (like end() in STL containe=
rs) */
> - #define VARBITEND(PTR)		(((bits8 *) (PTR)) + VARSIZE(PTR))
> - /* Mask that will cover exactly one byte, i.e. BITS_PER_BYTE bits */
> ---=20
> -1.7.5.4
> -
> diff --git a/meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN=
-OPTION-restrictions.patch b/meta-oe/recipes-support/postgresql/files/0003-=
Shore-up-ADMIN-OPTION-restrictions.patch
> deleted file mode 100644
> index abbe142..0000000
> --- a/meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN-OPTION=
-restrictions.patch
> +++ /dev/null
> @@ -1,273 +0,0 @@
> -From 15a8f97b9d16aaf659f58c981242b9da591cf24c Mon Sep 17 00:00:00 2001
> -From: Noah Misch <noah@leadboat.com>
> -Date: Mon, 17 Feb 2014 09:33:31 -0500
> -Subject: [PATCH] Shore up ADMIN OPTION restrictions.
> -
> -commit 15a8f97b9d16aaf659f58c981242b9da591cf24c REL9_2_STABLE
> -
> -Granting a role without ADMIN OPTION is supposed to prevent the grantee
> -from adding or removing members from the granted role.  Issuing SET ROLE
> -before the GRANT bypassed that, because the role itself had an implicit
> -right to add or remove members.  Plug that hole by recognizing that
> -implicit right only when the session user matches the current role.
> -Additionally, do not recognize it during a security-restricted operation
> -or during execution of a SECURITY DEFINER function.  The restriction on
> -SECURITY DEFINER is not security-critical.  However, it seems best for a
> -user testing his own SECURITY DEFINER function to see the same behavior
> -others will see.  Back-patch to 8.4 (all supported versions).
> -
> -The SQL standards do not conflate roles and users as PostgreSQL does;
> -only SQL roles have members, and only SQL users initiate sessions.  An
> -application using PostgreSQL users and roles as SQL users and roles will
> -never attempt to grant membership in the role that is the session user,
> -so the implicit right to add or remove members will never arise.
> -
> -The security impact was mostly that a role member could revoke access
> -from others, contrary to the wishes of his own grantor.  Unapproved role
> -member additions are less notable, because the member can still largely
> -achieve that by creating a view or a SECURITY DEFINER function.
> -
> -Reviewed by Andres Freund and Tom Lane.  Reported, independently, by
> -Jonas Sundman and Noah Misch.
> -
> -Security: CVE-2014-0060
> -
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - doc/src/sgml/ref/grant.sgml              |   12 ++++---
> - src/backend/commands/user.c              |   11 ++++++-
> - src/backend/utils/adt/acl.c              |   50 +++++++++++++++++++++++=
+------
> - src/test/regress/expected/privileges.out |   36 +++++++++++++++++++++-
> - src/test/regress/sql/privileges.sql      |   29 ++++++++++++++++-
> - 5 files changed, 120 insertions(+), 18 deletions(-)
> -
> -diff --git a/doc/src/sgml/ref/grant.sgml b/doc/src/sgml/ref/grant.sgml
> -index fb81af4..2b5a843 100644
> ---- a/doc/src/sgml/ref/grant.sgml
> -+++ b/doc/src/sgml/ref/grant.sgml
> -@@ -396,11 +396,13 @@ GRANT <replaceable class=3D"PARAMETER">role_name</=
replaceable> [, ...] TO <replace
> -   <para>
> -    If <literal>WITH ADMIN OPTION</literal> is specified, the member can
> -    in turn grant membership in the role to others, and revoke membership
> --   in the role as well.  Without the admin option, ordinary users canno=
t do
> --   that.  However,
> --   database superusers can grant or revoke membership in any role to an=
yone.
> --   Roles having <literal>CREATEROLE</> privilege can grant or revoke
> --   membership in any role that is not a superuser.
> -+   in the role as well.  Without the admin option, ordinary users cannot
> -+   do that.  A role is not considered to hold <literal>WITH ADMIN
> -+   OPTION</literal> on itself, but it may grant or revoke membership in
> -+   itself from a database session where the session user matches the
> -+   role.  Database superusers can grant or revoke membership in any role
> -+   to anyone.  Roles having <literal>CREATEROLE</> privilege can grant
> -+   or revoke membership in any role that is not a superuser.
> -   </para>
> -=20
> -   <para>
> -diff --git a/src/backend/commands/user.c b/src/backend/commands/user.c
> -index a22092c..39bf172 100644
> ---- a/src/backend/commands/user.c
> -+++ b/src/backend/commands/user.c
> -@@ -1334,7 +1334,16 @@ AddRoleMems(const char *rolename, Oid roleid,
> - 							rolename)));
> - 	}
> -=20
> --	/* XXX not sure about this check */
> -+	/*
> -+	 * The role membership grantor of record has little significance at
> -+	 * present.  Nonetheless, inasmuch as users might look to it for a cru=
de
> -+	 * audit trail, let only superusers impute the grant to a third party.
> -+	 *
> -+	 * Before lifting this restriction, give the member =3D=3D role case of
> -+	 * is_admin_of_role() a fresh look.  Ensure that the current role cann=
ot
> -+	 * use an explicit grantor specification to take advantage of the sess=
ion
> -+	 * user's self-admin right.
> -+	 */
> - 	if (grantorId !=3D GetUserId() && !superuser())
> - 		ereport(ERROR,
> - 				(errcode(ERRCODE_INSUFFICIENT_PRIVILEGE),
> -diff --git a/src/backend/utils/adt/acl.c b/src/backend/utils/adt/acl.c
> -index 1d6ae8b..9a52edb 100644
> ---- a/src/backend/utils/adt/acl.c
> -+++ b/src/backend/utils/adt/acl.c
> -@@ -4580,6 +4580,11 @@ pg_role_aclcheck(Oid role_oid, Oid roleid, AclMod=
e mode)
> - {
> - 	if (mode & ACL_GRANT_OPTION_FOR(ACL_CREATE))
> - 	{
> -+		/*
> -+		 * XXX For roleid =3D=3D role_oid, is_admin_of_role() also examines t=
he
> -+		 * session and call stack.  That suits two-argument pg_has_role(), but
> -+		 * it gives the three-argument version a lamentable whimsy.
> -+		 */
> - 		if (is_admin_of_role(roleid, role_oid))
> - 			return ACLCHECK_OK;
> - 	}
> -@@ -4897,11 +4902,9 @@ is_member_of_role_nosuper(Oid member, Oid role)
> -=20
> -=20
> - /*
> -- * Is member an admin of role (directly or indirectly)?  That is, is it
> -- * a member WITH ADMIN OPTION?
> -- *
> -- * We could cache the result as for is_member_of_role, but currently th=
is
> -- * is not used in any performance-critical paths, so we don't.
> -+ * Is member an admin of role?  That is, is member the role itself (sub=
ject to
> -+ * restrictions below), a member (directly or indirectly) WITH ADMIN OP=
TION,
> -+ * or a superuser?
> -  */
> - bool
> - is_admin_of_role(Oid member, Oid role)
> -@@ -4910,14 +4913,41 @@ is_admin_of_role(Oid member, Oid role)
> - 	List	   *roles_list;
> - 	ListCell   *l;
> -=20
> --	/* Fast path for simple case */
> --	if (member =3D=3D role)
> --		return true;
> --
> --	/* Superusers have every privilege, so are part of every role */
> - 	if (superuser_arg(member))
> - 		return true;
> -=20
> -+	if (member =3D=3D role)
> -+		/*
> -+		 * A role can admin itself when it matches the session user and we're
> -+		 * outside any security-restricted operation, SECURITY DEFINER or
> -+		 * similar context.  SQL-standard roles cannot self-admin.  However,
> -+		 * SQL-standard users are distinct from roles, and they are not
> -+		 * grantable like roles: PostgreSQL's role-user duality extends the
> -+		 * standard.  Checking for a session user match has the effect of
> -+		 * letting a role self-admin only when it's conspicuously behaving
> -+		 * like a user.  Note that allowing self-admin under a mere SET ROLE
> -+		 * would make WITH ADMIN OPTION largely irrelevant; any member could
> -+		 * SET ROLE to issue the otherwise-forbidden command.
> -+		 *
> -+		 * Withholding self-admin in a security-restricted operation prevents
> -+		 * object owners from harnessing the session user identity during
> -+		 * administrative maintenance.  Suppose Alice owns a database, has
> -+		 * issued "GRANT alice TO bob", and runs a daily ANALYZE.  Bob creates
> -+		 * an alice-owned SECURITY DEFINER function that issues "REVOKE alice
> -+		 * FROM carol".  If he creates an expression index calling that
> -+		 * function, Alice will attempt the REVOKE during each ANALYZE.
> -+		 * Checking InSecurityRestrictedOperation() thwarts that attack.
> -+		 *
> -+		 * Withholding self-admin in SECURITY DEFINER functions makes their
> -+		 * behavior independent of the calling user.  There's no security or
> -+		 * SQL-standard-conformance need for that restriction, though.
> -+		 *
> -+		 * A role cannot have actual WITH ADMIN OPTION on itself, because that
> -+		 * would imply a membership loop.  Therefore, we're done either way.
> -+		 */
> -+		return member =3D=3D GetSessionUserId() &&
> -+			!InLocalUserIdChange() && !InSecurityRestrictedOperation();
> -+
> - 	/*
> - 	 * Find all the roles that member is a member of, including multi-level
> - 	 * recursion.  We build a list in the same way that is_member_of_role =
does
> -diff --git a/src/test/regress/expected/privileges.out b/src/test/regress=
/expected/privileges.out
> -index e8930cb..bc6d731 100644
> ---- a/src/test/regress/expected/privileges.out
> -+++ b/src/test/regress/expected/privileges.out
> -@@ -32,7 +32,7 @@ ALTER GROUP regressgroup1 ADD USER regressuser4;
> - ALTER GROUP regressgroup2 ADD USER regressuser2;	-- duplicate
> - NOTICE:  role "regressuser2" is already a member of role "regressgroup2"
> - ALTER GROUP regressgroup2 DROP USER regressuser2;
> --ALTER GROUP regressgroup2 ADD USER regressuser4;
> -+GRANT regressgroup2 TO regressuser4 WITH ADMIN OPTION;
> - -- test owner privileges
> - SET SESSION AUTHORIZATION regressuser1;
> - SELECT session_user, current_user;
> -@@ -929,6 +929,40 @@ SELECT has_table_privilege('regressuser1', 'atest4'=
, 'SELECT WITH GRANT OPTION')
> -  t
> - (1 row)
> -=20
> -+-- Admin options
> -+SET SESSION AUTHORIZATION regressuser4;
> -+CREATE FUNCTION dogrant_ok() RETURNS void LANGUAGE sql SECURITY DEFINER=
 AS
> -+	'GRANT regressgroup2 TO regressuser5';
> -+GRANT regressgroup2 TO regressuser5; -- ok: had ADMIN OPTION
> -+SET ROLE regressgroup2;
> -+GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE suspended privi=
lege
> -+ERROR:  must have admin option on role "regressgroup2"
> -+SET SESSION AUTHORIZATION regressuser1;
> -+GRANT regressgroup2 TO regressuser5; -- fails: no ADMIN OPTION
> -+ERROR:  must have admin option on role "regressgroup2"
> -+SELECT dogrant_ok();			-- ok: SECURITY DEFINER conveys ADMIN
> -+NOTICE:  role "regressuser5" is already a member of role "regressgroup2"
> -+CONTEXT:  SQL function "dogrant_ok" statement 1
> -+ dogrant_ok=20
> -+------------
> -+=20
> -+(1 row)
> -+
> -+SET ROLE regressgroup2;
> -+GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE did not help
> -+ERROR:  must have admin option on role "regressgroup2"
> -+SET SESSION AUTHORIZATION regressgroup2;
> -+GRANT regressgroup2 TO regressuser5; -- ok: a role can self-admin
> -+NOTICE:  role "regressuser5" is already a member of role "regressgroup2"
> -+CREATE FUNCTION dogrant_fails() RETURNS void LANGUAGE sql SECURITY DEFI=
NER AS
> -+	'GRANT regressgroup2 TO regressuser5';
> -+SELECT dogrant_fails();			-- fails: no self-admin in SECURITY DEFINER
> -+ERROR:  must have admin option on role "regressgroup2"
> -+CONTEXT:  SQL function "dogrant_fails" statement 1
> -+DROP FUNCTION dogrant_fails();
> -+SET SESSION AUTHORIZATION regressuser4;
> -+DROP FUNCTION dogrant_ok();
> -+REVOKE regressgroup2 FROM regressuser5;
> - -- has_sequence_privilege tests
> - \c -
> - CREATE SEQUENCE x_seq;
> -diff --git a/src/test/regress/sql/privileges.sql b/src/test/regress/sql/=
privileges.sql
> -index d4d328e..5f1018a 100644
> ---- a/src/test/regress/sql/privileges.sql
> -+++ b/src/test/regress/sql/privileges.sql
> -@@ -37,7 +37,7 @@ ALTER GROUP regressgroup1 ADD USER regressuser4;
> -=20
> - ALTER GROUP regressgroup2 ADD USER regressuser2;	-- duplicate
> - ALTER GROUP regressgroup2 DROP USER regressuser2;
> --ALTER GROUP regressgroup2 ADD USER regressuser4;
> -+GRANT regressgroup2 TO regressuser4 WITH ADMIN OPTION;
> -=20
> - -- test owner privileges
> -=20
> -@@ -581,6 +581,33 @@ SELECT has_table_privilege('regressuser3', 'atest4'=
, 'SELECT'); -- false
> - SELECT has_table_privilege('regressuser1', 'atest4', 'SELECT WITH GRANT=
 OPTION'); -- true
> -=20
> -=20
> -+-- Admin options
> -+
> -+SET SESSION AUTHORIZATION regressuser4;
> -+CREATE FUNCTION dogrant_ok() RETURNS void LANGUAGE sql SECURITY DEFINER=
 AS
> -+	'GRANT regressgroup2 TO regressuser5';
> -+GRANT regressgroup2 TO regressuser5; -- ok: had ADMIN OPTION
> -+SET ROLE regressgroup2;
> -+GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE suspended privi=
lege
> -+
> -+SET SESSION AUTHORIZATION regressuser1;
> -+GRANT regressgroup2 TO regressuser5; -- fails: no ADMIN OPTION
> -+SELECT dogrant_ok();			-- ok: SECURITY DEFINER conveys ADMIN
> -+SET ROLE regressgroup2;
> -+GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE did not help
> -+
> -+SET SESSION AUTHORIZATION regressgroup2;
> -+GRANT regressgroup2 TO regressuser5; -- ok: a role can self-admin
> -+CREATE FUNCTION dogrant_fails() RETURNS void LANGUAGE sql SECURITY DEFI=
NER AS
> -+	'GRANT regressgroup2 TO regressuser5';
> -+SELECT dogrant_fails();			-- fails: no self-admin in SECURITY DEFINER
> -+DROP FUNCTION dogrant_fails();
> -+
> -+SET SESSION AUTHORIZATION regressuser4;
> -+DROP FUNCTION dogrant_ok();
> -+REVOKE regressgroup2 FROM regressuser5;
> -+
> -+
> - -- has_sequence_privilege tests
> - \c -
> -=20
> ---=20
> -1.7.5.4
> -
> diff --git a/meta-oe/recipes-support/postgresql/files/0004-Prevent-privil=
ege-escalation-in-explicit-calls-to-PL.patch b/meta-oe/recipes-support/post=
gresql/files/0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch
> deleted file mode 100644
> index cc2183a..0000000
> --- a/meta-oe/recipes-support/postgresql/files/0004-Prevent-privilege-esc=
alation-in-explicit-calls-to-PL.patch
> +++ /dev/null
> @@ -1,267 +0,0 @@
> -From 1d701d28a796ea2d1a4d2be9e9ee06209eaea040 Mon Sep 17 00:00:00 2001
> -From: Noah Misch <noah@leadboat.com>
> -Date: Mon, 17 Feb 2014 09:33:31 -0500
> -Subject: [PATCH] Prevent privilege escalation in explicit calls to PL
> - validators.
> -
> -commit 1d701d28a796ea2d1a4d2be9e9ee06209eaea040 REL9_2_STABLE
> -
> -The primary role of PL validators is to be called implicitly during
> -CREATE FUNCTION, but they are also normal functions that a user can call
> -explicitly.  Add a permissions check to each validator to ensure that a
> -user cannot use explicit validator calls to achieve things he could not
> -otherwise achieve.  Back-patch to 8.4 (all supported versions).
> -Non-core procedural language extensions ought to make the same two-line
> -change to their own validators.
> -
> -Andres Freund, reviewed by Tom Lane and Noah Misch.
> -
> -Security: CVE-2014-0061
> -
> -Upstream-Status: Backport
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - doc/src/sgml/plhandler.sgml         |    5 ++-
> - src/backend/catalog/pg_proc.c       |    9 ++++
> - src/backend/commands/functioncmds.c |    1 -
> - src/backend/utils/fmgr/fmgr.c       |   84 ++++++++++++++++++++++++++++=
+++++++
> - src/include/fmgr.h                  |    1 +
> - src/pl/plperl/plperl.c              |    4 ++
> - src/pl/plpgsql/src/pl_handler.c     |    3 +
> - src/pl/plpython/plpy_main.c         |    4 ++
> - 8 files changed, 109 insertions(+), 2 deletions(-)
> -
> -diff --git a/doc/src/sgml/plhandler.sgml b/doc/src/sgml/plhandler.sgml
> -index 024ef9d..aa4bba3 100644
> ---- a/doc/src/sgml/plhandler.sgml
> -+++ b/doc/src/sgml/plhandler.sgml
> -@@ -178,7 +178,10 @@ CREATE LANGUAGE plsample
> -     or updated a function written in the procedural language.
> -     The passed-in OID is the OID of the function's <classname>pg_proc</>
> -     row.  The validator must fetch this row in the usual way, and do
> --    whatever checking is appropriate.  Typical checks include verifying
> -+    whatever checking is appropriate.
> -+    First, call <function>CheckFunctionValidatorAccess()</> to diagnose
> -+    explicit calls to the validator that the user could not achieve thr=
ough
> -+    <command>CREATE FUNCTION</>.  Typical checks then include verifying
> -     that the function's argument and result types are supported by the
> -     language, and that the function's body is syntactically correct
> -     in the language.  If the validator finds the function to be okay,
> -diff --git a/src/backend/catalog/pg_proc.c b/src/backend/catalog/pg_proc=
=2Ec
> -index 3812408..3124868 100644
> ---- a/src/backend/catalog/pg_proc.c
> -+++ b/src/backend/catalog/pg_proc.c
> -@@ -718,6 +718,9 @@ fmgr_internal_validator(PG_FUNCTION_ARGS)
> - 	Datum		tmp;
> - 	char	   *prosrc;
> -=20
> -+	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
> -+		PG_RETURN_VOID();
> -+
> - 	/*
> - 	 * We do not honor check_function_bodies since it's unlikely the funct=
ion
> - 	 * name will be found later if it isn't there now.
> -@@ -763,6 +766,9 @@ fmgr_c_validator(PG_FUNCTION_ARGS)
> - 	char	   *prosrc;
> - 	char	   *probin;
> -=20
> -+	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
> -+		PG_RETURN_VOID();
> -+
> - 	/*
> - 	 * It'd be most consistent to skip the check if !check_function_bodies,
> - 	 * but the purpose of that switch is to be helpful for pg_dump loading,
> -@@ -814,6 +820,9 @@ fmgr_sql_validator(PG_FUNCTION_ARGS)
> - 	bool		haspolyarg;
> - 	int			i;
> -=20
> -+	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
> -+		PG_RETURN_VOID();
> -+
> - 	tuple =3D SearchSysCache1(PROCOID, ObjectIdGetDatum(funcoid));
> - 	if (!HeapTupleIsValid(tuple))
> - 		elog(ERROR, "cache lookup failed for function %u", funcoid);
> -diff --git a/src/backend/commands/functioncmds.c b/src/backend/commands/=
functioncmds.c
> -index 9ba6dd8..ea74b5e 100644
> ---- a/src/backend/commands/functioncmds.c
> -+++ b/src/backend/commands/functioncmds.c
> -@@ -997,7 +997,6 @@ CreateFunction(CreateFunctionStmt *stmt, const char =
*queryString)
> - 					prorows);
> - }
> -=20
> --
> - /*
> -  * Guts of function deletion.
> -  *
> -diff --git a/src/backend/utils/fmgr/fmgr.c b/src/backend/utils/fmgr/fmgr=
=2Ec
> -index 2ec63fa..8d6f183 100644
> ---- a/src/backend/utils/fmgr/fmgr.c
> -+++ b/src/backend/utils/fmgr/fmgr.c
> -@@ -24,6 +24,7 @@
> - #include "miscadmin.h"
> - #include "nodes/nodeFuncs.h"
> - #include "pgstat.h"
> -+#include "utils/acl.h"
> - #include "utils/builtins.h"
> - #include "utils/fmgrtab.h"
> - #include "utils/guc.h"
> -@@ -2445,3 +2446,86 @@ get_call_expr_arg_stable(Node *expr, int argnum)
> -=20
> - 	return false;
> - }
> -+
> -+/*---------------------------------------------------------------------=
----
> -+ *		Support routines for procedural language implementations
> -+ *---------------------------------------------------------------------=
----
> -+ */
> -+
> -+/*
> -+ * Verify that a validator is actually associated with the language of a
> -+ * particular function and that the user has access to both the languag=
e and
> -+ * the function.  All validators should call this before doing anything
> -+ * substantial.  Doing so ensures a user cannot achieve anything with e=
xplicit
> -+ * calls to validators that he could not achieve with CREATE FUNCTION o=
r by
> -+ * simply calling an existing function.
> -+ *
> -+ * When this function returns false, callers should skip all validation=
 work
> -+ * and call PG_RETURN_VOID().  This never happens at present; it is res=
erved
> -+ * for future expansion.
> -+ *
> -+ * In particular, checking that the validator corresponds to the functi=
on's
> -+ * language allows untrusted language validators to assume they process=
 only
> -+ * superuser-chosen source code.  (Untrusted language call handlers, by
> -+ * definition, do assume that.)  A user lacking the USAGE language priv=
ilege
> -+ * would be unable to reach the validator through CREATE FUNCTION, so w=
e check
> -+ * that to block explicit calls as well.  Checking the EXECUTE privileg=
e on
> -+ * the function is often superfluous, because most users can clone the
> -+ * function to get an executable copy.  It is meaningful against users =
with no
> -+ * database TEMP right and no permanent schema CREATE right, thereby un=
able to
> -+ * create any function.  Also, if the function tracks persistent state =
by
> -+ * function OID or name, validating the original function might permit =
more
> -+ * mischief than creating and validating a clone thereof.
> -+ */
> -+bool
> -+CheckFunctionValidatorAccess(Oid validatorOid, Oid functionOid)
> -+{
> -+	HeapTuple	procTup;
> -+	HeapTuple	langTup;
> -+	Form_pg_proc procStruct;
> -+	Form_pg_language langStruct;
> -+	AclResult	aclresult;
> -+
> -+	/* Get the function's pg_proc entry */
> -+	procTup =3D SearchSysCache1(PROCOID, ObjectIdGetDatum(functionOid));
> -+	if (!HeapTupleIsValid(procTup))
> -+		elog(ERROR, "cache lookup failed for function %u", functionOid);
> -+	procStruct =3D (Form_pg_proc) GETSTRUCT(procTup);
> -+
> -+	/*
> -+	 * Fetch pg_language entry to know if this is the correct validation
> -+	 * function for that pg_proc entry.
> -+	 */
> -+	langTup =3D SearchSysCache1(LANGOID, ObjectIdGetDatum(procStruct->prol=
ang));
> -+	if (!HeapTupleIsValid(langTup))
> -+		elog(ERROR, "cache lookup failed for language %u", procStruct->prolan=
g);
> -+	langStruct =3D (Form_pg_language) GETSTRUCT(langTup);
> -+
> -+	if (langStruct->lanvalidator !=3D validatorOid)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_INSUFFICIENT_PRIVILEGE),
> -+				 errmsg("language validation function %u called for language %u ins=
tead of %u",
> -+						validatorOid, procStruct->prolang,
> -+						langStruct->lanvalidator)));
> -+
> -+	/* first validate that we have permissions to use the language */
> -+	aclresult =3D pg_language_aclcheck(procStruct->prolang, GetUserId(),
> -+									 ACL_USAGE);
> -+	if (aclresult !=3D ACLCHECK_OK)
> -+		aclcheck_error(aclresult, ACL_KIND_LANGUAGE,
> -+					   NameStr(langStruct->lanname));
> -+
> -+	/*
> -+	 * Check whether we are allowed to execute the function itself. If we =
can
> -+	 * execute it, there should be no possible side-effect of
> -+	 * compiling/validation that execution can't have.
> -+	 */
> -+	aclresult =3D pg_proc_aclcheck(functionOid, GetUserId(), ACL_EXECUTE);
> -+	if (aclresult !=3D ACLCHECK_OK)
> -+		aclcheck_error(aclresult, ACL_KIND_PROC, NameStr(procStruct->proname)=
);
> -+
> -+	ReleaseSysCache(procTup);
> -+	ReleaseSysCache(langTup);
> -+
> -+	return true;
> -+}
> -diff --git a/src/include/fmgr.h b/src/include/fmgr.h
> -index 0a25776..f944cc6 100644
> ---- a/src/include/fmgr.h
> -+++ b/src/include/fmgr.h
> -@@ -624,6 +624,7 @@ extern Oid	get_fn_expr_argtype(FmgrInfo *flinfo, int=
 argnum);
> - extern Oid	get_call_expr_argtype(fmNodePtr expr, int argnum);
> - extern bool get_fn_expr_arg_stable(FmgrInfo *flinfo, int argnum);
> - extern bool get_call_expr_arg_stable(fmNodePtr expr, int argnum);
> -+extern bool CheckFunctionValidatorAccess(Oid validatorOid, Oid function=
Oid);
> -=20
> - /*
> -  * Routines in dfmgr.c
> -diff --git a/src/pl/plperl/plperl.c b/src/pl/plperl/plperl.c
> -index 7c2aee9..49d50c4 100644
> ---- a/src/pl/plperl/plperl.c
> -+++ b/src/pl/plperl/plperl.c
> -@@ -1847,6 +1847,9 @@ plperl_validator(PG_FUNCTION_ARGS)
> - 	bool		istrigger =3D false;
> - 	int			i;
> -=20
> -+	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
> -+		PG_RETURN_VOID();
> -+
> - 	/* Get the new function's pg_proc entry */
> - 	tuple =3D SearchSysCache1(PROCOID, ObjectIdGetDatum(funcoid));
> - 	if (!HeapTupleIsValid(tuple))
> -@@ -1926,6 +1929,7 @@ PG_FUNCTION_INFO_V1(plperlu_validator);
> - Datum
> - plperlu_validator(PG_FUNCTION_ARGS)
> - {
> -+	/* call plperl validator with our fcinfo so it gets our oid */
> - 	return plperl_validator(fcinfo);
> - }
> -=20
> -diff --git a/src/pl/plpgsql/src/pl_handler.c b/src/pl/plpgsql/src/pl_han=
dler.c
> -index 022ec3f..00b1a6f 100644
> ---- a/src/pl/plpgsql/src/pl_handler.c
> -+++ b/src/pl/plpgsql/src/pl_handler.c
> -@@ -227,6 +227,9 @@ plpgsql_validator(PG_FUNCTION_ARGS)
> - 	bool		istrigger =3D false;
> - 	int			i;
> -=20
> -+	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
> -+		PG_RETURN_VOID();
> -+
> - 	/* Get the new function's pg_proc entry */
> - 	tuple =3D SearchSysCache1(PROCOID, ObjectIdGetDatum(funcoid));
> - 	if (!HeapTupleIsValid(tuple))
> -diff --git a/src/pl/plpython/plpy_main.c b/src/pl/plpython/plpy_main.c
> -index c4de762..3847847 100644
> ---- a/src/pl/plpython/plpy_main.c
> -+++ b/src/pl/plpython/plpy_main.c
> -@@ -159,6 +159,9 @@ plpython_validator(PG_FUNCTION_ARGS)
> - 	Form_pg_proc procStruct;
> - 	bool		is_trigger;
> -=20
> -+	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
> -+		PG_RETURN_VOID();
> -+
> - 	if (!check_function_bodies)
> - 	{
> - 		PG_RETURN_VOID();
> -@@ -184,6 +187,7 @@ plpython_validator(PG_FUNCTION_ARGS)
> - Datum
> - plpython2_validator(PG_FUNCTION_ARGS)
> - {
> -+	/* call plpython validator with our fcinfo so it gets our oid */
> - 	return plpython_validator(fcinfo);
> - }
> - #endif   /* PY_MAJOR_VERSION < 3 */
> ---=20
> -1.7.5.4
> -
> diff --git a/meta-oe/recipes-support/postgresql/files/0005-Avoid-repeated=
-name-lookups-during-table-and-index-D.patch b/meta-oe/recipes-support/post=
gresql/files/0005-Avoid-repeated-name-lookups-during-table-and-index-D.patch
> deleted file mode 100644
> index f1aa212..0000000
> --- a/meta-oe/recipes-support/postgresql/files/0005-Avoid-repeated-name-l=
ookups-during-table-and-index-D.patch
> +++ /dev/null
> @@ -1,1082 +0,0 @@
> -From 820ab11fbfd508fc75a39c43ad2c1b3e79c4982b Mon Sep 17 00:00:00 2001
> -From: Robert Haas <rhaas@postgresql.org>
> -Date: Mon, 17 Feb 2014 09:33:31 -0500
> -Subject: [PATCH] Avoid repeated name lookups during table and index DDL.
> -
> -commit 820ab11fbfd508fc75a39c43ad2c1b3e79c4982b REL9_2_STABLE
> -
> -If the name lookups come to different conclusions due to concurrent
> -activity, we might perform some parts of the DDL on a different table
> -than other parts.  At least in the case of CREATE INDEX, this can be
> -used to cause the permissions checks to be performed against a
> -different table than the index creation, allowing for a privilege
> -escalation attack.
> -
> -This changes the calling convention for DefineIndex, CreateTrigger,
> -transformIndexStmt, transformAlterTableStmt, CheckIndexCompatible
> -(in 9.2 and newer), and AlterTable (in 9.1 and older).  In addition,
> -CheckRelationOwnership is removed in 9.2 and newer and the calling
> -convention is changed in older branches.  A field has also been added
> -to the Constraint node (FkConstraint in 8.4).  Third-party code calling
> -these functions or using the Constraint node will require updating.
> -
> -Report by Andres Freund.  Patch by Robert Haas and Andres Freund,
> -reviewed by Tom Lane.
> -
> -Security: CVE-2014-0062
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - src/backend/bootstrap/bootparse.y   |   17 ++++-
> - src/backend/catalog/index.c         |   10 +--
> - src/backend/catalog/pg_constraint.c |   19 +++++
> - src/backend/commands/indexcmds.c    |   22 ++++--
> - src/backend/commands/tablecmds.c    |  137 +++++++++++++++++++++++++---=
-------
> - src/backend/commands/trigger.c      |   28 ++++++--
> - src/backend/nodes/copyfuncs.c       |    1 +
> - src/backend/nodes/equalfuncs.c      |    1 +
> - src/backend/nodes/outfuncs.c        |    1 +
> - src/backend/parser/parse_utilcmd.c  |   64 ++++++-----------
> - src/backend/tcop/utility.c          |   73 +++++++------------
> - src/include/catalog/pg_constraint.h |    1 +
> - src/include/commands/defrem.h       |    4 +-
> - src/include/commands/tablecmds.h    |    2 +
> - src/include/commands/trigger.h      |    2 +-
> - src/include/nodes/parsenodes.h      |    2 +
> - src/include/parser/parse_utilcmd.h  |    5 +-
> - src/include/tcop/utility.h          |    2 -
> - 18 files changed, 234 insertions(+), 157 deletions(-)
> -
> -diff --git a/src/backend/bootstrap/bootparse.y b/src/backend/bootstrap/b=
ootparse.y
> -index f4a1b8f..eeffb0f 100644
> ---- a/src/backend/bootstrap/bootparse.y
> -+++ b/src/backend/bootstrap/bootparse.y
> -@@ -27,6 +27,7 @@
> - #include "bootstrap/bootstrap.h"
> - #include "catalog/catalog.h"
> - #include "catalog/heap.h"
> -+#include "catalog/namespace.h"
> - #include "catalog/pg_am.h"
> - #include "catalog/pg_attribute.h"
> - #include "catalog/pg_authid.h"
> -@@ -281,6 +282,7 @@ Boot_DeclareIndexStmt:
> - 		  XDECLARE INDEX boot_ident oidspec ON boot_ident USING boot_ident LP=
AREN boot_index_params RPAREN
> - 				{
> - 					IndexStmt *stmt =3D makeNode(IndexStmt);
> -+					Oid		relationId;
> -=20
> - 					do_start();
> -=20
> -@@ -302,7 +304,12 @@ Boot_DeclareIndexStmt:
> - 					stmt->initdeferred =3D false;
> - 					stmt->concurrent =3D false;
> -=20
> --					DefineIndex(stmt,
> -+					/* locks and races need not concern us in bootstrap mode */
> -+					relationId =3D RangeVarGetRelid(stmt->relation, NoLock,
> -+												  false);
> -+
> -+					DefineIndex(relationId,
> -+								stmt,
> - 								$4,
> - 								false,
> - 								false,
> -@@ -316,6 +323,7 @@ Boot_DeclareUniqueIndexStmt:
> - 		  XDECLARE UNIQUE INDEX boot_ident oidspec ON boot_ident USING boot_i=
dent LPAREN boot_index_params RPAREN
> - 				{
> - 					IndexStmt *stmt =3D makeNode(IndexStmt);
> -+					Oid		relationId;
> -=20
> - 					do_start();
> -=20
> -@@ -337,7 +345,12 @@ Boot_DeclareUniqueIndexStmt:
> - 					stmt->initdeferred =3D false;
> - 					stmt->concurrent =3D false;
> -=20
> --					DefineIndex(stmt,
> -+					/* locks and races need not concern us in bootstrap mode */
> -+					relationId =3D RangeVarGetRelid(stmt->relation, NoLock,
> -+												  false);
> -+
> -+					DefineIndex(relationId,
> -+								stmt,
> - 								$5,
> - 								false,
> - 								false,
> -diff --git a/src/backend/catalog/index.c b/src/backend/catalog/index.c
> -index 7d6346a..ca8acf3 100644
> ---- a/src/backend/catalog/index.c
> -+++ b/src/backend/catalog/index.c
> -@@ -1202,18 +1202,13 @@ index_constraint_create(Relation heapRelation,
> - 	 */
> - 	if (deferrable)
> - 	{
> --		RangeVar   *heapRel;
> - 		CreateTrigStmt *trigger;
> -=20
> --		heapRel =3D makeRangeVar(get_namespace_name(namespaceId),
> --							   pstrdup(RelationGetRelationName(heapRelation)),
> --							   -1);
> --
> - 		trigger =3D makeNode(CreateTrigStmt);
> - 		trigger->trigname =3D (constraintType =3D=3D CONSTRAINT_PRIMARY) ?
> - 			"PK_ConstraintTrigger" :
> - 			"Unique_ConstraintTrigger";
> --		trigger->relation =3D heapRel;
> -+		trigger->relation =3D NULL;
> - 		trigger->funcname =3D SystemFuncName("unique_key_recheck");
> - 		trigger->args =3D NIL;
> - 		trigger->row =3D true;
> -@@ -1226,7 +1221,8 @@ index_constraint_create(Relation heapRelation,
> - 		trigger->initdeferred =3D initdeferred;
> - 		trigger->constrrel =3D NULL;
> -=20
> --		(void) CreateTrigger(trigger, NULL, conOid, indexRelationId, true);
> -+		(void) CreateTrigger(trigger, NULL, RelationGetRelid(heapRelation),
> -+							 InvalidOid, conOid, indexRelationId, true);
> - 	}
> -=20
> - 	/*
> -diff --git a/src/backend/catalog/pg_constraint.c b/src/backend/catalog/p=
g_constraint.c
> -index 107a780..08a94cf 100644
> ---- a/src/backend/catalog/pg_constraint.c
> -+++ b/src/backend/catalog/pg_constraint.c
> -@@ -746,6 +746,25 @@ AlterConstraintNamespaces(Oid ownerId, Oid oldNspId,
> - }
> -=20
> - /*
> -+ * get_constraint_relation_oids
> -+ *		Find the IDs of the relations to which a constraint refers.
> -+ */
> -+void
> -+get_constraint_relation_oids(Oid constraint_oid, Oid *conrelid, Oid *co=
nfrelid)
> -+{
> -+	HeapTuple	tup;
> -+	Form_pg_constraint	con;
> -+
> -+	tup =3D SearchSysCache1(CONSTROID, ObjectIdGetDatum(constraint_oid));
> -+	if (!HeapTupleIsValid(tup)) /* should not happen */
> -+		elog(ERROR, "cache lookup failed for constraint %u", constraint_oid);
> -+	con =3D (Form_pg_constraint) GETSTRUCT(tup);
> -+	*conrelid =3D con->conrelid;
> -+	*confrelid =3D con->confrelid;
> -+	ReleaseSysCache(tup);
> -+}
> -+
> -+/*
> -  * get_relation_constraint_oid
> -  *		Find a constraint on the specified relation with the specified name.
> -  *		Returns constraint's OID.
> -diff --git a/src/backend/commands/indexcmds.c b/src/backend/commands/ind=
excmds.c
> -index f3ee278..ec5fb0d 100644
> ---- a/src/backend/commands/indexcmds.c
> -+++ b/src/backend/commands/indexcmds.c
> -@@ -111,7 +111,6 @@ static void RangeVarCallbackForReindexIndex(const Ra=
ngeVar *relation,
> -  */
> - bool
> - CheckIndexCompatible(Oid oldId,
> --					 RangeVar *heapRelation,
> - 					 char *accessMethodName,
> - 					 List *attributeList,
> - 					 List *exclusionOpNames)
> -@@ -139,7 +138,7 @@ CheckIndexCompatible(Oid oldId,
> - 	Datum		d;
> -=20
> - 	/* Caller should already have the relation locked in some way. */
> --	relationId =3D RangeVarGetRelid(heapRelation, NoLock, false);
> -+	relationId =3D IndexGetRelation(oldId, false);
> -=20
> - 	/*
> - 	 * We can pretend isconstraint =3D false unconditionally.  It only ser=
ves to
> -@@ -279,6 +278,8 @@ CheckIndexCompatible(Oid oldId,
> -  * DefineIndex
> -  *		Creates a new index.
> -  *
> -+ * 'relationId': the OID of the heap relation on which the index is to =
be
> -+ *		created
> -  * 'stmt': IndexStmt describing the properties of the new index.
> -  * 'indexRelationId': normally InvalidOid, but during bootstrap can be
> -  *		nonzero to specify a preselected OID for the index.
> -@@ -292,7 +293,8 @@ CheckIndexCompatible(Oid oldId,
> -  * Returns the OID of the created index.
> -  */
> - Oid
> --DefineIndex(IndexStmt *stmt,
> -+DefineIndex(Oid relationId,
> -+			IndexStmt *stmt,
> - 			Oid indexRelationId,
> - 			bool is_alter_table,
> - 			bool check_rights,
> -@@ -305,7 +307,6 @@ DefineIndex(IndexStmt *stmt,
> - 	Oid		   *collationObjectId;
> - 	Oid		   *classObjectId;
> - 	Oid			accessMethodId;
> --	Oid			relationId;
> - 	Oid			namespaceId;
> - 	Oid			tablespaceId;
> - 	List	   *indexColNames;
> -@@ -325,6 +326,7 @@ DefineIndex(IndexStmt *stmt,
> - 	int			n_old_snapshots;
> - 	LockRelId	heaprelid;
> - 	LOCKTAG		heaplocktag;
> -+	LOCKMODE	lockmode;
> - 	Snapshot	snapshot;
> - 	int			i;
> -=20
> -@@ -343,14 +345,18 @@ DefineIndex(IndexStmt *stmt,
> - 						INDEX_MAX_KEYS)));
> -=20
> - 	/*
> --	 * Open heap relation, acquire a suitable lock on it, remember its OID
> --	 *
> - 	 * Only SELECT ... FOR UPDATE/SHARE are allowed while doing a standard
> - 	 * index build; but for concurrent builds we allow INSERT/UPDATE/DELETE
> - 	 * (but not VACUUM).
> -+	 *
> -+	 * NB: Caller is responsible for making sure that relationId refers
> -+	 * to the relation on which the index should be built; except in boots=
trap
> -+	 * mode, this will typically require the caller to have already locked
> -+	 * the relation.  To avoid lock upgrade hazards, that lock should be at
> -+	 * least as strong as the one we take here.
> - 	 */
> --	rel =3D heap_openrv(stmt->relation,
> --					  (stmt->concurrent ? ShareUpdateExclusiveLock : ShareLock));
> -+	lockmode =3D stmt->concurrent ? ShareUpdateExclusiveLock : ShareLock;
> -+	rel =3D heap_open(relationId, lockmode);
> -=20
> - 	relationId =3D RelationGetRelid(rel);
> - 	namespaceId =3D RelationGetNamespace(rel);
> -diff --git a/src/backend/commands/tablecmds.c b/src/backend/commands/tab=
lecmds.c
> -index 7c1f779..bcb81ea 100644
> ---- a/src/backend/commands/tablecmds.c
> -+++ b/src/backend/commands/tablecmds.c
> -@@ -283,7 +283,8 @@ static void validateCheckConstraint(Relation rel, He=
apTuple constrtup);
> - static void validateForeignKeyConstraint(char *conname,
> - 							 Relation rel, Relation pkrel,
> - 							 Oid pkindOid, Oid constraintOid);
> --static void createForeignKeyTriggers(Relation rel, Constraint *fkconstr=
aint,
> -+static void createForeignKeyTriggers(Relation rel, Oid refRelOid,
> -+						 Constraint *fkconstraint,
> - 						 Oid constraintOid, Oid indexOid);
> - static void ATController(Relation rel, List *cmds, bool recurse, LOCKMO=
DE lockmode);
> - static void ATPrepCmd(List **wqueue, Relation rel, AlterTableCmd *cmd,
> -@@ -360,8 +361,9 @@ static void ATExecAlterColumnType(AlteredTableInfo *=
tab, Relation rel,
> - static void ATExecAlterColumnGenericOptions(Relation rel, const char *c=
olName,
> - 								List *options, LOCKMODE lockmode);
> - static void ATPostAlterTypeCleanup(List **wqueue, AlteredTableInfo *tab=
, LOCKMODE lockmode);
> --static void ATPostAlterTypeParse(Oid oldId, char *cmd,
> --					 List **wqueue, LOCKMODE lockmode, bool rewrite);
> -+static void ATPostAlterTypeParse(Oid oldId, Oid oldRelId, Oid refRelId,
> -+					 char *cmd, List **wqueue, LOCKMODE lockmode,
> -+					 bool rewrite);
> - static void TryReuseIndex(Oid oldId, IndexStmt *stmt);
> - static void TryReuseForeignKey(Oid oldId, Constraint *con);
> - static void change_owner_fix_column_acls(Oid relationOid,
> -@@ -5406,7 +5408,8 @@ ATExecAddIndex(AlteredTableInfo *tab, Relation rel,
> -=20
> - 	/* The IndexStmt has already been through transformIndexStmt */
> -=20
> --	new_index =3D DefineIndex(stmt,
> -+	new_index =3D DefineIndex(RelationGetRelid(rel),
> -+							stmt,
> - 							InvalidOid, /* no predefined OID */
> - 							true,		/* is_alter_table */
> - 							check_rights,
> -@@ -5728,7 +5731,10 @@ ATAddForeignKeyConstraint(AlteredTableInfo *tab, =
Relation rel,
> - 	 * table; trying to start with a lesser lock will just create a risk of
> - 	 * deadlock.)
> - 	 */
> --	pkrel =3D heap_openrv(fkconstraint->pktable, AccessExclusiveLock);
> -+	if (OidIsValid(fkconstraint->old_pktable_oid))
> -+		pkrel =3D heap_open(fkconstraint->old_pktable_oid, AccessExclusiveLoc=
k);
> -+	else
> -+		pkrel =3D heap_openrv(fkconstraint->pktable, AccessExclusiveLock);
> -=20
> - 	/*
> - 	 * Validity checks (permission checks wait till we have the column
> -@@ -6066,7 +6072,8 @@ ATAddForeignKeyConstraint(AlteredTableInfo *tab, R=
elation rel,
> - 	/*
> - 	 * Create the triggers that will enforce the constraint.
> - 	 */
> --	createForeignKeyTriggers(rel, fkconstraint, constrOid, indexOid);
> -+	createForeignKeyTriggers(rel, RelationGetRelid(pkrel), fkconstraint,
> -+							 constrOid, indexOid);
> -=20
> - 	/*
> - 	 * Tell Phase 3 to check that the constraint is satisfied by existing
> -@@ -6736,7 +6743,7 @@ validateForeignKeyConstraint(char *conname,
> - }
> -=20
> - static void
> --CreateFKCheckTrigger(RangeVar *myRel, Constraint *fkconstraint,
> -+CreateFKCheckTrigger(Oid myRelOid, Oid refRelOid, Constraint *fkconstra=
int,
> - 					 Oid constraintOid, Oid indexOid, bool on_insert)
> - {
> - 	CreateTrigStmt *fk_trigger;
> -@@ -6752,7 +6759,7 @@ CreateFKCheckTrigger(RangeVar *myRel, Constraint *=
fkconstraint,
> - 	 */
> - 	fk_trigger =3D makeNode(CreateTrigStmt);
> - 	fk_trigger->trigname =3D "RI_ConstraintTrigger_c";
> --	fk_trigger->relation =3D myRel;
> -+	fk_trigger->relation =3D NULL;
> - 	fk_trigger->row =3D true;
> - 	fk_trigger->timing =3D TRIGGER_TYPE_AFTER;
> -=20
> -@@ -6773,10 +6780,11 @@ CreateFKCheckTrigger(RangeVar *myRel, Constraint=
 *fkconstraint,
> - 	fk_trigger->isconstraint =3D true;
> - 	fk_trigger->deferrable =3D fkconstraint->deferrable;
> - 	fk_trigger->initdeferred =3D fkconstraint->initdeferred;
> --	fk_trigger->constrrel =3D fkconstraint->pktable;
> -+	fk_trigger->constrrel =3D NULL;
> - 	fk_trigger->args =3D NIL;
> -=20
> --	(void) CreateTrigger(fk_trigger, NULL, constraintOid, indexOid, true);
> -+	(void) CreateTrigger(fk_trigger, NULL, myRelOid, refRelOid, constraint=
Oid,
> -+						 indexOid, true);
> -=20
> - 	/* Make changes-so-far visible */
> - 	CommandCounterIncrement();
> -@@ -6786,18 +6794,13 @@ CreateFKCheckTrigger(RangeVar *myRel, Constraint=
 *fkconstraint,
> -  * Create the triggers that implement an FK constraint.
> -  */
> - static void
> --createForeignKeyTriggers(Relation rel, Constraint *fkconstraint,
> -+createForeignKeyTriggers(Relation rel, Oid refRelOid, Constraint *fkcon=
straint,
> - 						 Oid constraintOid, Oid indexOid)
> - {
> --	RangeVar   *myRel;
> -+	Oid			myRelOid;
> - 	CreateTrigStmt *fk_trigger;
> -=20
> --	/*
> --	 * Reconstruct a RangeVar for my relation (not passed in, unfortunatel=
y).
> --	 */
> --	myRel =3D makeRangeVar(get_namespace_name(RelationGetNamespace(rel)),
> --						 pstrdup(RelationGetRelationName(rel)),
> --						 -1);
> -+	myRelOid =3D RelationGetRelid(rel);
> -=20
> - 	/* Make changes-so-far visible */
> - 	CommandCounterIncrement();
> -@@ -6808,14 +6811,14 @@ createForeignKeyTriggers(Relation rel, Constrain=
t *fkconstraint,
> - 	 */
> - 	fk_trigger =3D makeNode(CreateTrigStmt);
> - 	fk_trigger->trigname =3D "RI_ConstraintTrigger_a";
> --	fk_trigger->relation =3D fkconstraint->pktable;
> -+	fk_trigger->relation =3D NULL;
> - 	fk_trigger->row =3D true;
> - 	fk_trigger->timing =3D TRIGGER_TYPE_AFTER;
> - 	fk_trigger->events =3D TRIGGER_TYPE_DELETE;
> - 	fk_trigger->columns =3D NIL;
> - 	fk_trigger->whenClause =3D NULL;
> - 	fk_trigger->isconstraint =3D true;
> --	fk_trigger->constrrel =3D myRel;
> -+	fk_trigger->constrrel =3D NULL;
> - 	switch (fkconstraint->fk_del_action)
> - 	{
> - 		case FKCONSTR_ACTION_NOACTION:
> -@@ -6850,7 +6853,8 @@ createForeignKeyTriggers(Relation rel, Constraint =
*fkconstraint,
> - 	}
> - 	fk_trigger->args =3D NIL;
> -=20
> --	(void) CreateTrigger(fk_trigger, NULL, constraintOid, indexOid, true);
> -+	(void) CreateTrigger(fk_trigger, NULL, refRelOid, myRelOid, constraint=
Oid,
> -+						 indexOid, true);
> -=20
> - 	/* Make changes-so-far visible */
> - 	CommandCounterIncrement();
> -@@ -6861,14 +6865,14 @@ createForeignKeyTriggers(Relation rel, Constrain=
t *fkconstraint,
> - 	 */
> - 	fk_trigger =3D makeNode(CreateTrigStmt);
> - 	fk_trigger->trigname =3D "RI_ConstraintTrigger_a";
> --	fk_trigger->relation =3D fkconstraint->pktable;
> -+	fk_trigger->relation =3D NULL;
> - 	fk_trigger->row =3D true;
> - 	fk_trigger->timing =3D TRIGGER_TYPE_AFTER;
> - 	fk_trigger->events =3D TRIGGER_TYPE_UPDATE;
> - 	fk_trigger->columns =3D NIL;
> - 	fk_trigger->whenClause =3D NULL;
> - 	fk_trigger->isconstraint =3D true;
> --	fk_trigger->constrrel =3D myRel;
> -+	fk_trigger->constrrel =3D NULL;
> - 	switch (fkconstraint->fk_upd_action)
> - 	{
> - 		case FKCONSTR_ACTION_NOACTION:
> -@@ -6903,7 +6907,8 @@ createForeignKeyTriggers(Relation rel, Constraint =
*fkconstraint,
> - 	}
> - 	fk_trigger->args =3D NIL;
> -=20
> --	(void) CreateTrigger(fk_trigger, NULL, constraintOid, indexOid, true);
> -+	(void) CreateTrigger(fk_trigger, NULL, refRelOid, myRelOid, constraint=
Oid,
> -+						 indexOid, true);
> -=20
> - 	/* Make changes-so-far visible */
> - 	CommandCounterIncrement();
> -@@ -6912,8 +6917,10 @@ createForeignKeyTriggers(Relation rel, Constraint=
 *fkconstraint,
> - 	 * Build and execute CREATE CONSTRAINT TRIGGER statements for the CHECK
> - 	 * action for both INSERTs and UPDATEs on the referencing table.
> - 	 */
> --	CreateFKCheckTrigger(myRel, fkconstraint, constraintOid, indexOid, tru=
e);
> --	CreateFKCheckTrigger(myRel, fkconstraint, constraintOid, indexOid, fal=
se);
> -+	CreateFKCheckTrigger(myRelOid, refRelOid, fkconstraint, constraintOid,
> -+						 indexOid, true);
> -+	CreateFKCheckTrigger(myRelOid, refRelOid, fkconstraint, constraintOid,
> -+						 indexOid, false);
> - }
> -=20
> - /*
> -@@ -7832,15 +7839,36 @@ ATPostAlterTypeCleanup(List **wqueue, AlteredTab=
leInfo *tab, LOCKMODE lockmode)
> - 	 * lock on the table the constraint is attached to, and we need to get
> - 	 * that before dropping.  It's safe because the parser won't actually =
look
> - 	 * at the catalogs to detect the existing entry.
> -+	 *
> -+	 * We can't rely on the output of deparsing to tell us which relation
> -+	 * to operate on, because concurrent activity might have made the name
> -+	 * resolve differently.  Instead, we've got to use the OID of the
> -+	 * constraint or index we're processing to figure out which relation
> -+	 * to operate on.
> - 	 */
> - 	forboth(oid_item, tab->changedConstraintOids,
> - 			def_item, tab->changedConstraintDefs)
> --		ATPostAlterTypeParse(lfirst_oid(oid_item), (char *) lfirst(def_item),
> -+	{
> -+		Oid		oldId =3D lfirst_oid(oid_item);
> -+		Oid		relid;
> -+		Oid		confrelid;
> -+
> -+		get_constraint_relation_oids(oldId, &relid, &confrelid);
> -+		ATPostAlterTypeParse(oldId, relid, confrelid,
> -+							 (char *) lfirst(def_item),
> - 							 wqueue, lockmode, tab->rewrite);
> -+	}
> - 	forboth(oid_item, tab->changedIndexOids,
> - 			def_item, tab->changedIndexDefs)
> --		ATPostAlterTypeParse(lfirst_oid(oid_item), (char *) lfirst(def_item),
> -+	{
> -+		Oid		oldId =3D lfirst_oid(oid_item);
> -+		Oid		relid;
> -+
> -+		relid =3D IndexGetRelation(oldId, false);
> -+		ATPostAlterTypeParse(oldId, relid, InvalidOid,
> -+							 (char *) lfirst(def_item),
> - 							 wqueue, lockmode, tab->rewrite);
> -+	}
> -=20
> - 	/*
> - 	 * Now we can drop the existing constraints and indexes --- constraints
> -@@ -7873,12 +7901,13 @@ ATPostAlterTypeCleanup(List **wqueue, AlteredTab=
leInfo *tab, LOCKMODE lockmode)
> - }
> -=20
> - static void
> --ATPostAlterTypeParse(Oid oldId, char *cmd,
> -+ATPostAlterTypeParse(Oid oldId, Oid oldRelId, Oid refRelId, char *cmd,
> - 					 List **wqueue, LOCKMODE lockmode, bool rewrite)
> - {
> - 	List	   *raw_parsetree_list;
> - 	List	   *querytree_list;
> - 	ListCell   *list_item;
> -+	Relation	rel;
> -=20
> - 	/*
> - 	 * We expect that we will get only ALTER TABLE and CREATE INDEX
> -@@ -7894,16 +7923,21 @@ ATPostAlterTypeParse(Oid oldId, char *cmd,
> -=20
> - 		if (IsA(stmt, IndexStmt))
> - 			querytree_list =3D lappend(querytree_list,
> --									 transformIndexStmt((IndexStmt *) stmt,
> -+									 transformIndexStmt(oldRelId,
> -+														(IndexStmt *) stmt,
> - 														cmd));
> - 		else if (IsA(stmt, AlterTableStmt))
> - 			querytree_list =3D list_concat(querytree_list,
> --							 transformAlterTableStmt((AlterTableStmt *) stmt,
> -+							 transformAlterTableStmt(oldRelId,
> -+													 (AlterTableStmt *) stmt,
> - 													 cmd));
> - 		else
> - 			querytree_list =3D lappend(querytree_list, stmt);
> - 	}
> -=20
> -+	/* Caller should already have acquired whatever lock we need. */
> -+	rel =3D relation_open(oldRelId, NoLock);
> -+
> - 	/*
> - 	 * Attach each generated command to the proper place in the work queue.
> - 	 * Note this could result in creation of entirely new work-queue entri=
es.
> -@@ -7915,7 +7949,6 @@ ATPostAlterTypeParse(Oid oldId, char *cmd,
> - 	foreach(list_item, querytree_list)
> - 	{
> - 		Node	   *stm =3D (Node *) lfirst(list_item);
> --		Relation	rel;
> - 		AlteredTableInfo *tab;
> -=20
> - 		switch (nodeTag(stm))
> -@@ -7928,14 +7961,12 @@ ATPostAlterTypeParse(Oid oldId, char *cmd,
> - 					if (!rewrite)
> - 						TryReuseIndex(oldId, stmt);
> -=20
> --					rel =3D relation_openrv(stmt->relation, lockmode);
> - 					tab =3D ATGetQueueEntry(wqueue, rel);
> - 					newcmd =3D makeNode(AlterTableCmd);
> - 					newcmd->subtype =3D AT_ReAddIndex;
> - 					newcmd->def =3D (Node *) stmt;
> - 					tab->subcmds[AT_PASS_OLD_INDEX] =3D
> - 						lappend(tab->subcmds[AT_PASS_OLD_INDEX], newcmd);
> --					relation_close(rel, NoLock);
> - 					break;
> - 				}
> - 			case T_AlterTableStmt:
> -@@ -7943,7 +7974,6 @@ ATPostAlterTypeParse(Oid oldId, char *cmd,
> - 					AlterTableStmt *stmt =3D (AlterTableStmt *) stm;
> - 					ListCell   *lcmd;
> -=20
> --					rel =3D relation_openrv(stmt->relation, lockmode);
> - 					tab =3D ATGetQueueEntry(wqueue, rel);
> - 					foreach(lcmd, stmt->cmds)
> - 					{
> -@@ -7964,6 +7994,7 @@ ATPostAlterTypeParse(Oid oldId, char *cmd,
> - 							case AT_AddConstraint:
> - 								Assert(IsA(cmd->def, Constraint));
> - 								con =3D (Constraint *) cmd->def;
> -+								con->old_pktable_oid =3D refRelId;
> - 								/* rewriting neither side of a FK */
> - 								if (con->contype =3D=3D CONSTR_FOREIGN &&
> - 									!rewrite && !tab->rewrite)
> -@@ -7977,7 +8008,6 @@ ATPostAlterTypeParse(Oid oldId, char *cmd,
> - 									 (int) cmd->subtype);
> - 						}
> - 					}
> --					relation_close(rel, NoLock);
> - 					break;
> - 				}
> - 			default:
> -@@ -7985,6 +8015,8 @@ ATPostAlterTypeParse(Oid oldId, char *cmd,
> - 					 (int) nodeTag(stm));
> - 		}
> - 	}
> -+
> -+	relation_close(rel, NoLock);
> - }
> -=20
> - /*
> -@@ -7995,7 +8027,6 @@ static void
> - TryReuseIndex(Oid oldId, IndexStmt *stmt)
> - {
> - 	if (CheckIndexCompatible(oldId,
> --							 stmt->relation,
> - 							 stmt->accessMethod,
> - 							 stmt->indexParams,
> - 							 stmt->excludeOpNames))
> -@@ -10291,6 +10322,38 @@ RangeVarCallbackOwnsTable(const RangeVar *relat=
ion,
> - }
> -=20
> - /*
> -+ * Callback to RangeVarGetRelidExtended(), similar to
> -+ * RangeVarCallbackOwnsTable() but without checks on the type of the re=
lation.
> -+ */
> -+void
> -+RangeVarCallbackOwnsRelation(const RangeVar *relation,
> -+							 Oid relId, Oid oldRelId, void *arg)
> -+{
> -+	HeapTuple	tuple;
> -+
> -+	/* Nothing to do if the relation was not found. */
> -+	if (!OidIsValid(relId))
> -+		return;
> -+
> -+	tuple =3D SearchSysCache1(RELOID, ObjectIdGetDatum(relId));
> -+	if (!HeapTupleIsValid(tuple))		/* should not happen */
> -+		elog(ERROR, "cache lookup failed for relation %u", relId);
> -+
> -+	if (!pg_class_ownercheck(relId, GetUserId()))
> -+		aclcheck_error(ACLCHECK_NOT_OWNER, ACL_KIND_CLASS,
> -+					   relation->relname);
> -+
> -+	if (!allowSystemTableMods &&
> -+		IsSystemClass((Form_pg_class) GETSTRUCT(tuple)))
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_INSUFFICIENT_PRIVILEGE),
> -+				 errmsg("permission denied: \"%s\" is a system catalog",
> -+						relation->relname)));
> -+
> -+	ReleaseSysCache(tuple);
> -+}
> -+
> -+/*
> -  * Common RangeVarGetRelid callback for rename, set schema, and alter t=
able
> -  * processing.
> -  */
> -diff --git a/src/backend/commands/trigger.c b/src/backend/commands/trigg=
er.c
> -index f546d94..9e6c954 100644
> ---- a/src/backend/commands/trigger.c
> -+++ b/src/backend/commands/trigger.c
> -@@ -42,6 +42,7 @@
> - #include "pgstat.h"
> - #include "rewrite/rewriteManip.h"
> - #include "storage/bufmgr.h"
> -+#include "storage/lmgr.h"
> - #include "tcop/utility.h"
> - #include "utils/acl.h"
> - #include "utils/builtins.h"
> -@@ -94,6 +95,13 @@ static void AfterTriggerSaveEvent(EState *estate, Res=
ultRelInfo *relinfo,
> -  * queryString is the source text of the CREATE TRIGGER command.
> -  * This must be supplied if a whenClause is specified, else it can be N=
ULL.
> -  *
> -+ * relOid, if nonzero, is the relation on which the trigger should be
> -+ * created.  If zero, the name provided in the statement will be looked=
 up.
> -+ *
> -+ * refRelOid, if nonzero, is the relation to which the constraint trigg=
er
> -+ * refers.  If zero, the constraint relation name provided in the state=
ment
> -+ * will be looked up as needed.
> -+ *
> -  * constraintOid, if nonzero, says that this trigger is being created
> -  * internally to implement that constraint.  A suitable pg_depend entry=
 will
> -  * be made to link the trigger to that constraint.	constraintOid is zer=
o when
> -@@ -116,7 +124,7 @@ static void AfterTriggerSaveEvent(EState *estate, Re=
sultRelInfo *relinfo,
> -  */
> - Oid
> - CreateTrigger(CreateTrigStmt *stmt, const char *queryString,
> --			  Oid constraintOid, Oid indexOid,
> -+			  Oid relOid, Oid refRelOid, Oid constraintOid, Oid indexOid,
> - 			  bool isInternal)
> - {
> - 	int16		tgtype;
> -@@ -145,7 +153,10 @@ CreateTrigger(CreateTrigStmt *stmt, const char *que=
ryString,
> - 	ObjectAddress myself,
> - 				referenced;
> -=20
> --	rel =3D heap_openrv(stmt->relation, AccessExclusiveLock);
> -+	if (OidIsValid(relOid))
> -+		rel =3D heap_open(relOid, AccessExclusiveLock);
> -+	else
> -+		rel =3D heap_openrv(stmt->relation, AccessExclusiveLock);
> -=20
> - 	/*
> - 	 * Triggers must be on tables or views, and there are additional
> -@@ -194,7 +205,7 @@ CreateTrigger(CreateTrigStmt *stmt, const char *quer=
yString,
> - 				 errmsg("permission denied: \"%s\" is a system catalog",
> - 						RelationGetRelationName(rel))));
> -=20
> --	if (stmt->isconstraint && stmt->constrrel !=3D NULL)
> -+	if (stmt->isconstraint)
> - 	{
> - 		/*
> - 		 * We must take a lock on the target relation to protect against
> -@@ -203,7 +214,14 @@ CreateTrigger(CreateTrigStmt *stmt, const char *que=
ryString,
> - 		 * might end up creating a pg_constraint entry referencing a
> - 		 * nonexistent table.
> - 		 */
> --		constrrelid =3D RangeVarGetRelid(stmt->constrrel, AccessShareLock, fa=
lse);
> -+		if (OidIsValid(refRelOid))
> -+		{
> -+			LockRelationOid(refRelOid, AccessShareLock);
> -+			constrrelid =3D refRelOid;
> -+		}
> -+		else if (stmt->constrrel !=3D NULL)
> -+			constrrelid =3D RangeVarGetRelid(stmt->constrrel, AccessShareLock,
> -+										   false);
> - 	}
> -=20
> - 	/* permission checks */
> -@@ -513,7 +531,7 @@ CreateTrigger(CreateTrigStmt *stmt, const char *quer=
yString,
> - 				ereport(ERROR,
> - 						(errcode(ERRCODE_DUPLICATE_OBJECT),
> - 				  errmsg("trigger \"%s\" for relation \"%s\" already exists",
> --						 trigname, stmt->relation->relname)));
> -+						 trigname, RelationGetRelationName(rel))));
> - 		}
> - 		systable_endscan(tgscan);
> - 	}
> -diff --git a/src/backend/nodes/copyfuncs.c b/src/backend/nodes/copyfuncs=
=2Ec
> -index 9bac994..dbe0f6a 100644
> ---- a/src/backend/nodes/copyfuncs.c
> -+++ b/src/backend/nodes/copyfuncs.c
> -@@ -2357,6 +2357,7 @@ _copyConstraint(const Constraint *from)
> - 	COPY_SCALAR_FIELD(fk_upd_action);
> - 	COPY_SCALAR_FIELD(fk_del_action);
> - 	COPY_NODE_FIELD(old_conpfeqop);
> -+	COPY_SCALAR_FIELD(old_pktable_oid);
> - 	COPY_SCALAR_FIELD(skip_validation);
> - 	COPY_SCALAR_FIELD(initially_valid);
> -=20
> -diff --git a/src/backend/nodes/equalfuncs.c b/src/backend/nodes/equalfun=
cs.c
> -index d185654..f8770b0 100644
> ---- a/src/backend/nodes/equalfuncs.c
> -+++ b/src/backend/nodes/equalfuncs.c
> -@@ -2143,6 +2143,7 @@ _equalConstraint(const Constraint *a, const Constr=
aint *b)
> - 	COMPARE_SCALAR_FIELD(fk_upd_action);
> - 	COMPARE_SCALAR_FIELD(fk_del_action);
> - 	COMPARE_NODE_FIELD(old_conpfeqop);
> -+	COMPARE_SCALAR_FIELD(old_pktable_oid);
> - 	COMPARE_SCALAR_FIELD(skip_validation);
> - 	COMPARE_SCALAR_FIELD(initially_valid);
> -=20
> -diff --git a/src/backend/nodes/outfuncs.c b/src/backend/nodes/outfuncs.c
> -index 1df71f6..888ffd2 100644
> ---- a/src/backend/nodes/outfuncs.c
> -+++ b/src/backend/nodes/outfuncs.c
> -@@ -2653,6 +2653,7 @@ _outConstraint(StringInfo str, const Constraint *n=
ode)
> - 			WRITE_CHAR_FIELD(fk_upd_action);
> - 			WRITE_CHAR_FIELD(fk_del_action);
> - 			WRITE_NODE_FIELD(old_conpfeqop);
> -+			WRITE_OID_FIELD(old_pktable_oid);
> - 			WRITE_BOOL_FIELD(skip_validation);
> - 			WRITE_BOOL_FIELD(initially_valid);
> - 			break;
> -diff --git a/src/backend/parser/parse_utilcmd.c b/src/backend/parser/par=
se_utilcmd.c
> -index e3f9c62..5df939a 100644
> ---- a/src/backend/parser/parse_utilcmd.c
> -+++ b/src/backend/parser/parse_utilcmd.c
> -@@ -1867,14 +1867,18 @@ transformFKConstraints(CreateStmtContext *cxt,
> -  * a predicate expression.	There are several code paths that create ind=
exes
> -  * without bothering to call this, because they know they don't have any
> -  * such expressions to deal with.
> -+ *
> -+ * To avoid race conditions, it's important that this function rely onl=
y on
> -+ * the passed-in relid (and not on stmt->relation) to determine the tar=
get
> -+ * relation.
> -  */
> - IndexStmt *
> --transformIndexStmt(IndexStmt *stmt, const char *queryString)
> -+transformIndexStmt(Oid relid, IndexStmt *stmt, const char *queryString)
> - {
> --	Relation	rel;
> - 	ParseState *pstate;
> - 	RangeTblEntry *rte;
> - 	ListCell   *l;
> -+	Relation	rel;
> -=20
> - 	/*
> - 	 * We must not scribble on the passed-in IndexStmt, so copy it.  (This=
 is
> -@@ -1882,26 +1886,17 @@ transformIndexStmt(IndexStmt *stmt, const char *=
queryString)
> - 	 */
> - 	stmt =3D (IndexStmt *) copyObject(stmt);
> -=20
> --	/*
> --	 * Open the parent table with appropriate locking.	We must do this
> --	 * because addRangeTableEntry() would acquire only AccessShareLock,
> --	 * leaving DefineIndex() needing to do a lock upgrade with consequent =
risk
> --	 * of deadlock.  Make sure this stays in sync with the type of lock
> --	 * DefineIndex() wants. If we are being called by ALTER TABLE, we will
> --	 * already hold a higher lock.
> --	 */
> --	rel =3D heap_openrv(stmt->relation,
> --				  (stmt->concurrent ? ShareUpdateExclusiveLock : ShareLock));
> --
> - 	/* Set up pstate */
> - 	pstate =3D make_parsestate(NULL);
> - 	pstate->p_sourcetext =3D queryString;
> -=20
> - 	/*
> - 	 * Put the parent table into the rtable so that the expressions can re=
fer
> --	 * to its fields without qualification.
> -+	 * to its fields without qualification.  Caller is responsible for loc=
king
> -+	 * relation, but we still need to open it.
> - 	 */
> --	rte =3D addRangeTableEntry(pstate, stmt->relation, NULL, false, true);
> -+	rel =3D relation_open(relid, NoLock);
> -+	rte =3D addRangeTableEntryForRelation(pstate, rel, NULL, false, true);
> -=20
> - 	/* no to join list, yes to namespaces */
> - 	addRTEtoQuery(pstate, rte, false, true, true);
> -@@ -1955,7 +1950,7 @@ transformIndexStmt(IndexStmt *stmt, const char *qu=
eryString)
> -=20
> - 	free_parsestate(pstate);
> -=20
> --	/* Close relation, but keep the lock */
> -+	/* Close relation */
> - 	heap_close(rel, NoLock);
> -=20
> - 	return stmt;
> -@@ -2277,9 +2272,14 @@ transformRuleStmt(RuleStmt *stmt, const char *que=
ryString,
> -  * Returns a List of utility commands to be done in sequence.  One of t=
hese
> -  * will be the transformed AlterTableStmt, but there may be additional =
actions
> -  * to be done before and after the actual AlterTable() call.
> -+ *
> -+ * To avoid race conditions, it's important that this function rely onl=
y on
> -+ * the passed-in relid (and not on stmt->relation) to determine the tar=
get
> -+ * relation.
> -  */
> - List *
> --transformAlterTableStmt(AlterTableStmt *stmt, const char *queryString)
> -+transformAlterTableStmt(Oid relid, AlterTableStmt *stmt,
> -+						const char *queryString)
> - {
> - 	Relation	rel;
> - 	ParseState *pstate;
> -@@ -2291,7 +2291,6 @@ transformAlterTableStmt(AlterTableStmt *stmt, cons=
t char *queryString)
> - 	List	   *newcmds =3D NIL;
> - 	bool		skipValidation =3D true;
> - 	AlterTableCmd *newcmd;
> --	LOCKMODE	lockmode;
> -=20
> - 	/*
> - 	 * We must not scribble on the passed-in AlterTableStmt, so copy it. (=
This
> -@@ -2299,29 +2298,8 @@ transformAlterTableStmt(AlterTableStmt *stmt, con=
st char *queryString)
> - 	 */
> - 	stmt =3D (AlterTableStmt *) copyObject(stmt);
> -=20
> --	/*
> --	 * Determine the appropriate lock level for this list of subcommands.
> --	 */
> --	lockmode =3D AlterTableGetLockLevel(stmt->cmds);
> --
> --	/*
> --	 * Acquire appropriate lock on the target relation, which will be held
> --	 * until end of transaction.  This ensures any decisions we make here
> --	 * based on the state of the relation will still be good at execution.=
 We
> --	 * must get lock now because execution will later require it; taking a
> --	 * lower grade lock now and trying to upgrade later risks deadlock.  A=
ny
> --	 * new commands we add after this must not upgrade the lock level
> --	 * requested here.
> --	 */
> --	rel =3D relation_openrv_extended(stmt->relation, lockmode, stmt->missi=
ng_ok);
> --	if (rel =3D=3D NULL)
> --	{
> --		/* this message is consistent with relation_openrv */
> --		ereport(NOTICE,
> --				(errmsg("relation \"%s\" does not exist, skipping",
> --						stmt->relation->relname)));
> --		return NIL;
> --	}
> -+	/* Caller is responsible for locking the relation */
> -+	rel =3D relation_open(relid, NoLock);
> -=20
> - 	/* Set up pstate and CreateStmtContext */
> - 	pstate =3D make_parsestate(NULL);
> -@@ -2434,7 +2412,7 @@ transformAlterTableStmt(AlterTableStmt *stmt, cons=
t char *queryString)
> - 		IndexStmt  *idxstmt =3D (IndexStmt *) lfirst(l);
> -=20
> - 		Assert(IsA(idxstmt, IndexStmt));
> --		idxstmt =3D transformIndexStmt(idxstmt, queryString);
> -+		idxstmt =3D transformIndexStmt(relid, idxstmt, queryString);
> - 		newcmd =3D makeNode(AlterTableCmd);
> - 		newcmd->subtype =3D OidIsValid(idxstmt->indexOid) ? AT_AddIndexConstr=
aint : AT_AddIndex;
> - 		newcmd->def =3D (Node *) idxstmt;
> -@@ -2458,7 +2436,7 @@ transformAlterTableStmt(AlterTableStmt *stmt, cons=
t char *queryString)
> - 		newcmds =3D lappend(newcmds, newcmd);
> - 	}
> -=20
> --	/* Close rel but keep lock */
> -+	/* Close rel */
> - 	relation_close(rel, NoLock);
> -=20
> - 	/*
> -diff --git a/src/backend/tcop/utility.c b/src/backend/tcop/utility.c
> -index 509bf4d..7903e03 100644
> ---- a/src/backend/tcop/utility.c
> -+++ b/src/backend/tcop/utility.c
> -@@ -67,49 +67,6 @@ ProcessUtility_hook_type ProcessUtility_hook =3D NULL;
> -=20
> -=20
> - /*
> -- * Verify user has ownership of specified relation, else ereport.
> -- *
> -- * If noCatalogs is true then we also deny access to system catalogs,
> -- * except when allowSystemTableMods is true.
> -- */
> --void
> --CheckRelationOwnership(RangeVar *rel, bool noCatalogs)
> --{
> --	Oid			relOid;
> --	HeapTuple	tuple;
> --
> --	/*
> --	 * XXX: This is unsafe in the presence of concurrent DDL, since it is
> --	 * called before acquiring any lock on the target relation.  However,
> --	 * locking the target relation (especially using something like
> --	 * AccessExclusiveLock) before verifying that the user has permissions=
 is
> --	 * not appealing either.
> --	 */
> --	relOid =3D RangeVarGetRelid(rel, NoLock, false);
> --
> --	tuple =3D SearchSysCache1(RELOID, ObjectIdGetDatum(relOid));
> --	if (!HeapTupleIsValid(tuple))		/* should not happen */
> --		elog(ERROR, "cache lookup failed for relation %u", relOid);
> --
> --	if (!pg_class_ownercheck(relOid, GetUserId()))
> --		aclcheck_error(ACLCHECK_NOT_OWNER, ACL_KIND_CLASS,
> --					   rel->relname);
> --
> --	if (noCatalogs)
> --	{
> --		if (!allowSystemTableMods &&
> --			IsSystemClass((Form_pg_class) GETSTRUCT(tuple)))
> --			ereport(ERROR,
> --					(errcode(ERRCODE_INSUFFICIENT_PRIVILEGE),
> --					 errmsg("permission denied: \"%s\" is a system catalog",
> --							rel->relname)));
> --	}
> --
> --	ReleaseSysCache(tuple);
> --}
> --
> --
> --/*
> -  * CommandIsReadOnly: is an executable query read-only?
> -  *
> -  * This is a much stricter test than we apply for XactReadOnly mode;
> -@@ -723,7 +680,8 @@ standard_ProcessUtility(Node *parsetree,
> - 				if (OidIsValid(relid))
> - 				{
> - 					/* Run parse analysis ... */
> --					stmts =3D transformAlterTableStmt(atstmt, queryString);
> -+					stmts =3D transformAlterTableStmt(relid, atstmt,
> -+													queryString);
> -=20
> - 					/* ... and do it */
> - 					foreach(l, stmts)
> -@@ -910,18 +868,36 @@ standard_ProcessUtility(Node *parsetree,
> - 		case T_IndexStmt:		/* CREATE INDEX */
> - 			{
> - 				IndexStmt  *stmt =3D (IndexStmt *) parsetree;
> -+				Oid			relid;
> -+				LOCKMODE	lockmode;
> -=20
> - 				if (stmt->concurrent)
> - 					PreventTransactionChain(isTopLevel,
> - 											"CREATE INDEX CONCURRENTLY");
> -=20
> --				CheckRelationOwnership(stmt->relation, true);
> -+				/*
> -+				 * Look up the relation OID just once, right here at the
> -+				 * beginning, so that we don't end up repeating the name
> -+				 * lookup later and latching onto a different relation
> -+				 * partway through.  To avoid lock upgrade hazards, it's
> -+				 * important that we take the strongest lock that will
> -+				 * eventually be needed here, so the lockmode calculation
> -+				 * needs to match what DefineIndex() does.
> -+				 */
> -+				lockmode =3D stmt->concurrent ? ShareUpdateExclusiveLock
> -+					: ShareLock;
> -+				relid =3D
> -+					RangeVarGetRelidExtended(stmt->relation, lockmode,
> -+											 false, false,
> -+											 RangeVarCallbackOwnsRelation,
> -+											 NULL);
> -=20
> - 				/* Run parse analysis ... */
> --				stmt =3D transformIndexStmt(stmt, queryString);
> -+				stmt =3D transformIndexStmt(relid, stmt, queryString);
> -=20
> - 				/* ... and do it */
> --				DefineIndex(stmt,
> -+				DefineIndex(relid,	/* OID of heap relation */
> -+							stmt,
> - 							InvalidOid, /* no predefined OID */
> - 							false,		/* is_alter_table */
> - 							true,		/* check_rights */
> -@@ -1057,7 +1033,8 @@ standard_ProcessUtility(Node *parsetree,
> -=20
> - 		case T_CreateTrigStmt:
> - 			(void) CreateTrigger((CreateTrigStmt *) parsetree, queryString,
> --								 InvalidOid, InvalidOid, false);
> -+								 InvalidOid, InvalidOid, InvalidOid,
> -+								 InvalidOid, false);
> - 			break;
> -=20
> - 		case T_CreatePLangStmt:
> -diff --git a/src/include/catalog/pg_constraint.h b/src/include/catalog/p=
g_constraint.h
> -index d9d40b2..d8f8da4 100644
> ---- a/src/include/catalog/pg_constraint.h
> -+++ b/src/include/catalog/pg_constraint.h
> -@@ -246,6 +246,7 @@ extern char *ChooseConstraintName(const char *name1,=
 const char *name2,
> -=20
> - extern void AlterConstraintNamespaces(Oid ownerId, Oid oldNspId,
> - 						  Oid newNspId, bool isType, ObjectAddresses *objsMoved);
> -+extern void get_constraint_relation_oids(Oid constraint_oid, Oid *conre=
lid, Oid *confrelid);
> - extern Oid	get_relation_constraint_oid(Oid relid, const char *conname, =
bool missing_ok);
> - extern Oid	get_domain_constraint_oid(Oid typid, const char *conname, bo=
ol missing_ok);
> -=20
> -diff --git a/src/include/commands/defrem.h b/src/include/commands/defrem=
=2Eh
> -index 9b6d57a..a00fd37 100644
> ---- a/src/include/commands/defrem.h
> -+++ b/src/include/commands/defrem.h
> -@@ -20,7 +20,8 @@
> - extern void RemoveObjects(DropStmt *stmt);
> -=20
> - /* commands/indexcmds.c */
> --extern Oid DefineIndex(IndexStmt *stmt,
> -+extern Oid DefineIndex(Oid relationId,
> -+			IndexStmt *stmt,
> - 			Oid indexRelationId,
> - 			bool is_alter_table,
> - 			bool check_rights,
> -@@ -35,7 +36,6 @@ extern char *makeObjectName(const char *name1, const c=
har *name2,
> - extern char *ChooseRelationName(const char *name1, const char *name2,
> - 				   const char *label, Oid namespaceid);
> - extern bool CheckIndexCompatible(Oid oldId,
> --					 RangeVar *heapRelation,
> - 					 char *accessMethodName,
> - 					 List *attributeList,
> - 					 List *exclusionOpNames);
> -diff --git a/src/include/commands/tablecmds.h b/src/include/commands/tab=
lecmds.h
> -index 4f32062..d41f8a1 100644
> ---- a/src/include/commands/tablecmds.h
> -+++ b/src/include/commands/tablecmds.h
> -@@ -78,4 +78,6 @@ extern void AtEOSubXact_on_commit_actions(bool isCommi=
t,
> - extern void RangeVarCallbackOwnsTable(const RangeVar *relation,
> - 						  Oid relId, Oid oldRelId, void *arg);
> -=20
> -+extern void RangeVarCallbackOwnsRelation(const RangeVar *relation,
> -+						  Oid relId, Oid oldRelId, void *noCatalogs);
> - #endif   /* TABLECMDS_H */
> -diff --git a/src/include/commands/trigger.h b/src/include/commands/trigg=
er.h
> -index 9303341..0869c0b 100644
> ---- a/src/include/commands/trigger.h
> -+++ b/src/include/commands/trigger.h
> -@@ -109,7 +109,7 @@ extern PGDLLIMPORT int SessionReplicationRole;
> - #define TRIGGER_DISABLED					'D'
> -=20
> - extern Oid CreateTrigger(CreateTrigStmt *stmt, const char *queryString,
> --			  Oid constraintOid, Oid indexOid,
> -+			  Oid relOid, Oid refRelOid, Oid constraintOid, Oid indexOid,
> - 			  bool isInternal);
> -=20
> - extern void RemoveTriggerById(Oid trigOid);
> -diff --git a/src/include/nodes/parsenodes.h b/src/include/nodes/parsenod=
es.h
> -index 327f7cf..31f5479 100644
> ---- a/src/include/nodes/parsenodes.h
> -+++ b/src/include/nodes/parsenodes.h
> -@@ -1566,6 +1566,8 @@ typedef struct Constraint
> - 	/* Fields used for constraints that allow a NOT VALID specification */
> - 	bool		skip_validation;	/* skip validation of existing rows? */
> - 	bool		initially_valid;	/* mark the new constraint as valid? */
> -+
> -+	Oid			old_pktable_oid; /* pg_constraint.confrelid of my former self */
> - } Constraint;
> -=20
> - /* ----------------------
> -diff --git a/src/include/parser/parse_utilcmd.h b/src/include/parser/par=
se_utilcmd.h
> -index 4ad793a..d8b340e 100644
> ---- a/src/include/parser/parse_utilcmd.h
> -+++ b/src/include/parser/parse_utilcmd.h
> -@@ -18,9 +18,10 @@
> -=20
> -=20
> - extern List *transformCreateStmt(CreateStmt *stmt, const char *queryStr=
ing);
> --extern List *transformAlterTableStmt(AlterTableStmt *stmt,
> -+extern List *transformAlterTableStmt(Oid relid, AlterTableStmt *stmt,
> - 						const char *queryString);
> --extern IndexStmt *transformIndexStmt(IndexStmt *stmt, const char *query=
String);
> -+extern IndexStmt *transformIndexStmt(Oid relid, IndexStmt *stmt,
> -+				   const char *queryString);
> - extern void transformRuleStmt(RuleStmt *stmt, const char *queryString,
> - 				  List **actions, Node **whereClause);
> - extern List *transformCreateSchemaStmt(CreateSchemaStmt *stmt);
> -diff --git a/src/include/tcop/utility.h b/src/include/tcop/utility.h
> -index 54190b2..ae871ca 100644
> ---- a/src/include/tcop/utility.h
> -+++ b/src/include/tcop/utility.h
> -@@ -42,6 +42,4 @@ extern LogStmtLevel GetCommandLogLevel(Node *parsetree=
);
> -=20
> - extern bool CommandIsReadOnly(Node *parsetree);
> -=20
> --extern void CheckRelationOwnership(RangeVar *rel, bool noCatalogs);
> --
> - #endif   /* UTILITY_H */
> ---=20
> -1.7.5.4
> -
> diff --git a/meta-oe/recipes-support/postgresql/files/0006-Fix-handling-o=
f-wide-datetime-input-output.patch b/meta-oe/recipes-support/postgresql/fil=
es/0006-Fix-handling-of-wide-datetime-input-output.patch
> deleted file mode 100644
> index fac0a73..0000000
> --- a/meta-oe/recipes-support/postgresql/files/0006-Fix-handling-of-wide-=
datetime-input-output.patch
> +++ /dev/null
> @@ -1,465 +0,0 @@
> -From f416622be81d1320417bbc7892fd562cae0dba72 Mon Sep 17 00:00:00 2001
> -From: Noah Misch <noah@leadboat.com>
> -Date: Mon, 17 Feb 2014 09:33:31 -0500
> -Subject: [PATCH] Fix handling of wide datetime input/output.
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -commit f416622be81d1320417bbc7892fd562cae0dba72 REL9_2_STABLE
> -
> -Many server functions use the MAXDATELEN constant to size a buffer for
> -parsing or displaying a datetime value.  It was much too small for the
> -longest possible interval output and slightly too small for certain
> -valid timestamp input, particularly input with a long timezone name.
> -The long input was rejected needlessly; the long output caused
> -interval_out() to overrun its buffer.  ECPG's pgtypes library has a copy
> -of the vulnerable functions, which bore the same vulnerabilities along
> -with some of its own.  In contrast to the server, certain long inputs
> -caused stack overflow rather than failing cleanly.  Back-patch to 8.4
> -(all supported versions).
> -
> -Reported by Daniel Sch=FCssler, reviewed by Tom Lane.
> -
> -Security: CVE-2014-0063
> -
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - src/include/utils/datetime.h                       |   17 +++++---
> - src/interfaces/ecpg/pgtypeslib/datetime.c          |    4 +-
> - src/interfaces/ecpg/pgtypeslib/dt.h                |   17 +++++---
> - src/interfaces/ecpg/pgtypeslib/dt_common.c         |   44 +++++++++++++=
+------
> - src/interfaces/ecpg/pgtypeslib/interval.c          |    2 +-
> - src/interfaces/ecpg/pgtypeslib/timestamp.c         |    2 +-
> - .../ecpg/test/expected/pgtypeslib-dt_test2.c       |   22 +++++++---
> - .../ecpg/test/expected/pgtypeslib-dt_test2.stdout  |   19 ++++++++
> - src/interfaces/ecpg/test/pgtypeslib/dt_test2.pgc   |   10 ++++
> - src/test/regress/expected/interval.out             |    7 +++
> - src/test/regress/sql/interval.sql                  |    2 +
> - 11 files changed, 111 insertions(+), 35 deletions(-)
> -
> -diff --git a/src/include/utils/datetime.h b/src/include/utils/datetime.h
> -index d73cc8d..4b805b6 100644
> ---- a/src/include/utils/datetime.h
> -+++ b/src/include/utils/datetime.h
> -@@ -188,12 +188,17 @@ struct tzEntry;
> - #define DTK_DATE_M		(DTK_M(YEAR) | DTK_M(MONTH) | DTK_M(DAY))
> - #define DTK_TIME_M		(DTK_M(HOUR) | DTK_M(MINUTE) | DTK_ALL_SECS_M)
> -=20
> --#define MAXDATELEN		63		/* maximum possible length of an input date
> --								 * string (not counting tr. null) */
> --#define MAXDATEFIELDS	25		/* maximum possible number of fields in a date
> --								 * string */
> --#define TOKMAXLEN		10		/* only this many chars are stored in
> --								 * datetktbl */
> -+/*
> -+ * Working buffer size for input and output of interval, timestamp, etc.
> -+ * Inputs that need more working space will be rejected early.  Longer =
outputs
> -+ * will overrun buffers, so this must suffice for all possible output. =
 As of
> -+ * this writing, interval_out() needs the most space at ~90 bytes.
> -+ */
> -+#define MAXDATELEN		128
> -+/* maximum possible number of fields in a date string */
> -+#define MAXDATEFIELDS	25
> -+/* only this many chars are stored in datetktbl */
> -+#define TOKMAXLEN		10
> -=20
> - /* keep this struct small; it gets used a lot */
> - typedef struct
> -diff --git a/src/interfaces/ecpg/pgtypeslib/datetime.c b/src/interfaces/=
ecpg/pgtypeslib/datetime.c
> -index 823626f..4adcd1e 100644
> ---- a/src/interfaces/ecpg/pgtypeslib/datetime.c
> -+++ b/src/interfaces/ecpg/pgtypeslib/datetime.c
> -@@ -61,14 +61,14 @@ PGTYPESdate_from_asc(char *str, char **endptr)
> - 	int			nf;
> - 	char	   *field[MAXDATEFIELDS];
> - 	int			ftype[MAXDATEFIELDS];
> --	char		lowstr[MAXDATELEN + 1];
> -+	char		lowstr[MAXDATELEN + MAXDATEFIELDS];
> - 	char	   *realptr;
> - 	char	  **ptr =3D (endptr !=3D NULL) ? endptr : &realptr;
> -=20
> - 	bool		EuroDates =3D FALSE;
> -=20
> - 	errno =3D 0;
> --	if (strlen(str) >=3D sizeof(lowstr))
> -+	if (strlen(str) > MAXDATELEN)
> - 	{
> - 		errno =3D PGTYPES_DATE_BAD_DATE;
> - 		return INT_MIN;
> -diff --git a/src/interfaces/ecpg/pgtypeslib/dt.h b/src/interfaces/ecpg/p=
gtypeslib/dt.h
> -index dfe6f9e..2780593 100644
> ---- a/src/interfaces/ecpg/pgtypeslib/dt.h
> -+++ b/src/interfaces/ecpg/pgtypeslib/dt.h
> -@@ -192,12 +192,17 @@ typedef double fsec_t;
> - #define DTK_DATE_M		(DTK_M(YEAR) | DTK_M(MONTH) | DTK_M(DAY))
> - #define DTK_TIME_M		(DTK_M(HOUR) | DTK_M(MINUTE) | DTK_M(SECOND))
> -=20
> --#define MAXDATELEN		63		/* maximum possible length of an input date
> --								 * string (not counting tr. null) */
> --#define MAXDATEFIELDS	25		/* maximum possible number of fields in a date
> --								 * string */
> --#define TOKMAXLEN		10		/* only this many chars are stored in
> --								 * datetktbl */
> -+/*
> -+ * Working buffer size for input and output of interval, timestamp, etc.
> -+ * Inputs that need more working space will be rejected early.  Longer =
outputs
> -+ * will overrun buffers, so this must suffice for all possible output. =
 As of
> -+ * this writing, PGTYPESinterval_to_asc() needs the most space at ~90 b=
ytes.
> -+ */
> -+#define MAXDATELEN		128
> -+/* maximum possible number of fields in a date string */
> -+#define MAXDATEFIELDS	25
> -+/* only this many chars are stored in datetktbl */
> -+#define TOKMAXLEN		10
> -=20
> - /* keep this struct small; it gets used a lot */
> - typedef struct
> -diff --git a/src/interfaces/ecpg/pgtypeslib/dt_common.c b/src/interfaces=
/ecpg/pgtypeslib/dt_common.c
> -index 6b89e4a..18178dd 100644
> ---- a/src/interfaces/ecpg/pgtypeslib/dt_common.c
> -+++ b/src/interfaces/ecpg/pgtypeslib/dt_common.c
> -@@ -1171,15 +1171,22 @@ DecodeNumberField(int len, char *str, int fmask,
> - 	if ((cp =3D strchr(str, '.')) !=3D NULL)
> - 	{
> - #ifdef HAVE_INT64_TIMESTAMP
> --		char		fstr[MAXDATELEN + 1];
> -+		char		fstr[7];
> -+		int			i;
> -+
> -+		cp++;
> -=20
> - 		/*
> - 		 * OK, we have at most six digits to care about. Let's construct a
> --		 * string and then do the conversion to an integer.
> -+		 * string with those digits, zero-padded on the right, and then do
> -+		 * the conversion to an integer.
> -+		 *
> -+		 * XXX This truncates the seventh digit, unlike rounding it as do
> -+		 * the backend and the !HAVE_INT64_TIMESTAMP case.
> - 		 */
> --		strcpy(fstr, (cp + 1));
> --		strcpy(fstr + strlen(fstr), "000000");
> --		*(fstr + 6) =3D '\0';
> -+		for (i =3D 0; i < 6; i++)
> -+			fstr[i] =3D *cp !=3D '\0' ? *cp++ : '0';
> -+		fstr[i] =3D '\0';
> - 		*fsec =3D strtol(fstr, NULL, 10);
> - #else
> - 		*fsec =3D strtod(cp, NULL);
> -@@ -1531,15 +1538,22 @@ DecodeTime(char *str, int *tmask, struct tm * tm=
, fsec_t *fsec)
> - 		else if (*cp =3D=3D '.')
> - 		{
> - #ifdef HAVE_INT64_TIMESTAMP
> --			char		fstr[MAXDATELEN + 1];
> -+			char		fstr[7];
> -+			int			i;
> -+
> -+			cp++;
> -=20
> - 			/*
> --			 * OK, we have at most six digits to work with. Let's construct a
> --			 * string and then do the conversion to an integer.
> -+			 * OK, we have at most six digits to care about. Let's construct a
> -+			 * string with those digits, zero-padded on the right, and then do
> -+			 * the conversion to an integer.
> -+			 *
> -+			 * XXX This truncates the seventh digit, unlike rounding it as do
> -+			 * the backend and the !HAVE_INT64_TIMESTAMP case.
> - 			 */
> --			strncpy(fstr, (cp + 1), 7);
> --			strcpy(fstr + strlen(fstr), "000000");
> --			*(fstr + 6) =3D '\0';
> -+			for (i =3D 0; i < 6; i++)
> -+				fstr[i] =3D *cp !=3D '\0' ? *cp++ : '0';
> -+			fstr[i] =3D '\0';
> - 			*fsec =3D strtol(fstr, &cp, 10);
> - #else
> - 			str =3D cp;
> -@@ -1665,6 +1679,9 @@ DecodePosixTimezone(char *str, int *tzp)
> -  *	DTK_NUMBER can hold date fields (yy.ddd)
> -  *	DTK_STRING can hold months (January) and time zones (PST)
> -  *	DTK_DATE can hold Posix time zones (GMT-8)
> -+ *
> -+ * The "lowstr" work buffer must have at least strlen(timestr) + MAXDAT=
EFIELDS
> -+ * bytes of space.  On output, field[] entries will point into it.
> -  */
> - int
> - ParseDateTime(char *timestr, char *lowstr,
> -@@ -1677,7 +1694,10 @@ ParseDateTime(char *timestr, char *lowstr,
> - 	/* outer loop through fields */
> - 	while (*(*endstr) !=3D '\0')
> - 	{
> -+		/* Record start of current field */
> - 		field[nf] =3D lp;
> -+		if (nf >=3D MAXDATEFIELDS)
> -+			return -1;
> -=20
> - 		/* leading digit? then date or time */
> - 		if (isdigit((unsigned char) *(*endstr)))
> -@@ -1818,8 +1838,6 @@ ParseDateTime(char *timestr, char *lowstr,
> - 		/* force in a delimiter after each field */
> - 		*lp++ =3D '\0';
> - 		nf++;
> --		if (nf > MAXDATEFIELDS)
> --			return -1;
> - 	}
> -=20
> - 	*numfields =3D nf;
> -diff --git a/src/interfaces/ecpg/pgtypeslib/interval.c b/src/interfaces/=
ecpg/pgtypeslib/interval.c
> -index bcc10ee..fdd8f49 100644
> ---- a/src/interfaces/ecpg/pgtypeslib/interval.c
> -+++ b/src/interfaces/ecpg/pgtypeslib/interval.c
> -@@ -1092,7 +1092,7 @@ PGTYPESinterval_from_asc(char *str, char **endptr)
> - 	tm->tm_sec =3D 0;
> - 	fsec =3D 0;
> -=20
> --	if (strlen(str) >=3D sizeof(lowstr))
> -+	if (strlen(str) > MAXDATELEN)
> - 	{
> - 		errno =3D PGTYPES_INTVL_BAD_INTERVAL;
> - 		return NULL;
> -diff --git a/src/interfaces/ecpg/pgtypeslib/timestamp.c b/src/interfaces=
/ecpg/pgtypeslib/timestamp.c
> -index 7d3f7c8..4f91e63 100644
> ---- a/src/interfaces/ecpg/pgtypeslib/timestamp.c
> -+++ b/src/interfaces/ecpg/pgtypeslib/timestamp.c
> -@@ -297,7 +297,7 @@ PGTYPEStimestamp_from_asc(char *str, char **endptr)
> - 	char	   *realptr;
> - 	char	  **ptr =3D (endptr !=3D NULL) ? endptr : &realptr;
> -=20
> --	if (strlen(str) >=3D sizeof(lowstr))
> -+	if (strlen(str) > MAXDATELEN)
> - 	{
> - 		errno =3D PGTYPES_TS_BAD_TIMESTAMP;
> - 		return (noresult);
> -diff --git a/src/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.c b/s=
rc/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.c
> -index d3ebb0e..0ba1936 100644
> ---- a/src/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.c
> -+++ b/src/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.c
> -@@ -45,6 +45,15 @@ char *dates[] =3D { "19990108foobar",
> - 				  "1999.008",
> - 				  "J2451187",
> - 				  "January 8, 99 BC",
> -+				  /*
> -+				   * Maximize space usage in ParseDateTime() with 25
> -+				   * (MAXDATEFIELDS) fields and 128 (MAXDATELEN) total length.
> -+				   */
> -+				  "........................Xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
> -+				  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
",
> -+				  /* 26 fields */
> -+				  ".........................aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
> -+				  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
",
> - 				  NULL };
> -=20
> - /* do not conflict with libc "times" symbol */
> -@@ -52,6 +61,7 @@ static char *times[] =3D { "0:04",
> - 				  "1:59 PDT",
> - 				  "13:24:40 -8:00",
> - 				  "13:24:40.495+3",
> -+				  "13:24:40.123456789+3",
> - 				  NULL };
> -=20
> - char *intervals[] =3D { "1 minute",
> -@@ -73,22 +83,22 @@ main(void)
> - 		=20
> - 		=20
> - =09
> --#line 52 "dt_test2.pgc"
> -+#line 62 "dt_test2.pgc"
> -  date date1 ;
> - =20
> --#line 53 "dt_test2.pgc"
> -+#line 63 "dt_test2.pgc"
> -  timestamp ts1 , ts2 ;
> - =20
> --#line 54 "dt_test2.pgc"
> -+#line 64 "dt_test2.pgc"
> -  char * text ;
> - =20
> --#line 55 "dt_test2.pgc"
> -+#line 65 "dt_test2.pgc"
> -  interval * i1 ;
> - =20
> --#line 56 "dt_test2.pgc"
> -+#line 66 "dt_test2.pgc"
> -  date * dc ;
> - /* exec sql end declare section */
> --#line 57 "dt_test2.pgc"
> -+#line 67 "dt_test2.pgc"
> -=20
> -=20
> - 	int i, j;
> -diff --git a/src/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.stdou=
t b/src/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.stdout
> -index 24e9d26..9a4587b 100644
> ---- a/src/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.stdout
> -+++ b/src/interfaces/ecpg/test/expected/pgtypeslib-dt_test2.stdout
> -@@ -8,85 +8,104 @@ TS[3,0]: 1999-01-08 00:04:00
> - TS[3,1]: 1999-01-08 01:59:00
> - TS[3,2]: 1999-01-08 13:24:40
> - TS[3,3]: 1999-01-08 13:24:40.495
> -+TS[3,4]: 1999-01-08 13:24:40.123456
> - Date[4]: 1999-01-08 (N - F)
> - TS[4,0]: 1999-01-08 00:04:00
> - TS[4,1]: 1999-01-08 01:59:00
> - TS[4,2]: 1999-01-08 13:24:40
> - TS[4,3]: 1999-01-08 13:24:40.495
> -+TS[4,4]: 1999-01-08 13:24:40.123456
> - Date[5]: 1999-01-08 (N - F)
> - TS[5,0]: 1999-01-08 00:04:00
> - TS[5,1]: 1999-01-08 01:59:00
> - TS[5,2]: 1999-01-08 13:24:40
> - TS[5,3]: 1999-01-08 13:24:40.495
> -+TS[5,4]: 1999-01-08 13:24:40.123456
> - Date[6]: 1999-01-18 (N - F)
> - TS[6,0]: 1999-01-18 00:04:00
> - TS[6,1]: 1999-01-18 01:59:00
> - TS[6,2]: 1999-01-18 13:24:40
> - TS[6,3]: 1999-01-18 13:24:40.495
> -+TS[6,4]: 1999-01-18 13:24:40.123456
> - Date[7]: 2003-01-02 (N - F)
> - TS[7,0]: 2003-01-02 00:04:00
> - TS[7,1]: 2003-01-02 01:59:00
> - TS[7,2]: 2003-01-02 13:24:40
> - TS[7,3]: 2003-01-02 13:24:40.495
> -+TS[7,4]: 2003-01-02 13:24:40.123456
> - Date[8]: 1999-01-08 (N - F)
> - TS[8,0]: 1999-01-08 00:04:00
> - TS[8,1]: 1999-01-08 01:59:00
> - TS[8,2]: 1999-01-08 13:24:40
> - TS[8,3]: 1999-01-08 13:24:40.495
> -+TS[8,4]: 1999-01-08 13:24:40.123456
> - Date[9]: 1999-01-08 (N - F)
> - TS[9,0]: 1999-01-08 00:04:00
> - TS[9,1]: 1999-01-08 01:59:00
> - TS[9,2]: 1999-01-08 13:24:40
> - TS[9,3]: 1999-01-08 13:24:40.495
> -+TS[9,4]: 1999-01-08 13:24:40.123456
> - Date[10]: 1999-01-08 (N - F)
> - TS[10,0]: 1999-01-08 00:04:00
> - TS[10,1]: 1999-01-08 01:59:00
> - TS[10,2]: 1999-01-08 13:24:40
> - TS[10,3]: 1999-01-08 13:24:40.495
> -+TS[10,4]: 1999-01-08 13:24:40.123456
> - Date[11]: 1999-01-08 (N - F)
> - TS[11,0]: 1999-01-08 00:04:00
> - TS[11,1]: 1999-01-08 01:59:00
> - TS[11,2]: 1999-01-08 13:24:40
> - TS[11,3]: 1999-01-08 13:24:40.495
> -+TS[11,4]: 1999-01-08 13:24:40.123456
> - Date[12]: 1999-01-08 (N - F)
> - TS[12,0]: 1999-01-08 00:04:00
> - TS[12,1]: 1999-01-08 01:59:00
> - TS[12,2]: 1999-01-08 13:24:40
> - TS[12,3]: 1999-01-08 13:24:40.495
> -+TS[12,4]: 1999-01-08 13:24:40.123456
> - Date[13]: 2006-01-08 (N - F)
> - TS[13,0]: 2006-01-08 00:04:00
> - TS[13,1]: 2006-01-08 01:59:00
> - TS[13,2]: 2006-01-08 13:24:40
> - TS[13,3]: 2006-01-08 13:24:40.495
> -+TS[13,4]: 2006-01-08 13:24:40.123456
> - Date[14]: 1999-01-08 (N - F)
> - TS[14,0]: 1999-01-08 00:04:00
> - TS[14,1]: 1999-01-08 01:59:00
> - TS[14,2]: 1999-01-08 13:24:40
> - TS[14,3]: 1999-01-08 13:24:40.495
> -+TS[14,4]: 1999-01-08 13:24:40.123456
> - Date[15]: 1999-01-08 (N - F)
> - TS[15,0]: 1999-01-08 00:04:00
> - TS[15,1]: 1999-01-08 01:59:00
> - TS[15,2]: 1999-01-08 13:24:40
> - TS[15,3]: 1999-01-08 13:24:40.495
> -+TS[15,4]: 1999-01-08 13:24:40.123456
> - Date[16]: 1999-01-08 (N - F)
> - TS[16,0]: 1999-01-08 00:04:00
> - TS[16,1]: 1999-01-08 01:59:00
> - TS[16,2]: 1999-01-08 13:24:40
> - TS[16,3]: 1999-01-08 13:24:40.495
> -+TS[16,4]: 1999-01-08 13:24:40.123456
> - Date[17]: 1999-01-08 (N - F)
> - TS[17,0]: 1999-01-08 00:04:00
> - TS[17,1]: 1999-01-08 01:59:00
> - TS[17,2]: 1999-01-08 13:24:40
> - TS[17,3]: 1999-01-08 13:24:40.495
> -+TS[17,4]: 1999-01-08 13:24:40.123456
> - Date[18]: 1999-01-08 (N - F)
> - TS[18,0]: 1999-01-08 00:04:00
> - TS[18,1]: 1999-01-08 01:59:00
> - TS[18,2]: 1999-01-08 13:24:40
> - TS[18,3]: 1999-01-08 13:24:40.495
> -+TS[18,4]: 1999-01-08 13:24:40.123456
> - Date[19]: 0099-01-08 BC (N - F)
> - TS[19,0]: 0099-01-08 00:04:00 BC
> - TS[19,1]: 0099-01-08 01:59:00 BC
> - TS[19,2]: 0099-01-08 13:24:40 BC
> -+TS[19,4]: 0099-01-08 13:24:40.123456 BC
> -+Date[20]: - (N - T)
> -+Date[21]: - (N - T)
> - interval[0]: @ 1 min
> - interval_copy[0]: @ 1 min
> - interval[1]: @ 1 day 12 hours 59 mins 10 secs
> -diff --git a/src/interfaces/ecpg/test/pgtypeslib/dt_test2.pgc b/src/inte=
rfaces/ecpg/test/pgtypeslib/dt_test2.pgc
> -index 0edf012..a127dd9 100644
> ---- a/src/interfaces/ecpg/test/pgtypeslib/dt_test2.pgc
> -+++ b/src/interfaces/ecpg/test/pgtypeslib/dt_test2.pgc
> -@@ -27,6 +27,15 @@ char *dates[] =3D { "19990108foobar",
> - 				  "1999.008",
> - 				  "J2451187",
> - 				  "January 8, 99 BC",
> -+				  /*
> -+				   * Maximize space usage in ParseDateTime() with 25
> -+				   * (MAXDATEFIELDS) fields and 128 (MAXDATELEN) total length.
> -+				   */
> -+				  "........................Xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
> -+				  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
",
> -+				  /* 26 fields */
> -+				  ".........................aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
> -+				  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
",
> - 				  NULL };
> -=20
> - /* do not conflict with libc "times" symbol */
> -@@ -34,6 +43,7 @@ static char *times[] =3D { "0:04",
> - 				  "1:59 PDT",
> - 				  "13:24:40 -8:00",
> - 				  "13:24:40.495+3",
> -+				  "13:24:40.123456789+3",
> - 				  NULL };
> -=20
> - char *intervals[] =3D { "1 minute",
> -diff --git a/src/test/regress/expected/interval.out b/src/test/regress/e=
xpected/interval.out
> -index 3bf2211..99fd0ca 100644
> ---- a/src/test/regress/expected/interval.out
> -+++ b/src/test/regress/expected/interval.out
> -@@ -306,6 +306,13 @@ select '4 millenniums 5 centuries 4 decades 1 year =
4 months 4 days 17 minutes 31
> -  @ 4541 years 4 mons 4 days 17 mins 31 secs
> - (1 row)
> -=20
> -+-- test long interval output
> -+select '100000000y 10mon -1000000000d -1000000000h -10min -10.000001s a=
go'::interval;
> -+                                         interval                      =
                   =20
> -+-----------------------------------------------------------------------=
--------------------
> -+ @ 100000000 years 10 mons -1000000000 days -1000000000 hours -10 mins =
-10.000001 secs ago
> -+(1 row)
> -+
> - -- test justify_hours() and justify_days()
> - SELECT justify_hours(interval '6 months 3 days 52 hours 3 minutes 2 sec=
onds') as "6 mons 5 days 4 hours 3 mins 2 seconds";
> -  6 mons 5 days 4 hours 3 mins 2 seconds=20
> -diff --git a/src/test/regress/sql/interval.sql b/src/test/regress/sql/in=
terval.sql
> -index f1da4c2..7cee286 100644
> ---- a/src/test/regress/sql/interval.sql
> -+++ b/src/test/regress/sql/interval.sql
> -@@ -108,6 +108,8 @@ select avg(f1) from interval_tbl;
> - -- test long interval input
> - select '4 millenniums 5 centuries 4 decades 1 year 4 months 4 days 17 m=
inutes 31 seconds'::interval;
> -=20
> -+-- test long interval output
> -+select '100000000y 10mon -1000000000d -1000000000h -10min -10.000001s a=
go'::interval;
> -=20
> - -- test justify_hours() and justify_days()
> -=20
> ---=20
> -1.7.5.4
> -
> diff --git a/meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-=
available-to-pg_regress-of-ECPG-and-is.patch b/meta-oe/recipes-support/post=
gresql/files/0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and-is.patch
> deleted file mode 100644
> index 3cffc0a..0000000
> --- a/meta-oe/recipes-support/postgresql/files/0007-Make-pqsignal-availab=
le-to-pg_regress-of-ECPG-and-is.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -From 0ae841a98c21c53901d5bc9a9323a8cc800364f6 Mon Sep 17 00:00:00 2001
> -From: Noah Misch <noah@leadboat.com>
> -Date: Sat, 14 Jun 2014 10:52:25 -0400
> -Subject: [PATCH] Make pqsignal() available to pg_regress of ECPG and
> - isolation suites.
> -
> -commit 0ae841a98c21c53901d5bc9a9323a8cc800364f6 REL9_2_STABLE
> -
> -Commit 453a5d91d49e4d35054f92785d830df4067e10c1 made it available to the
> -src/test/regress build of pg_regress, but all pg_regress builds need the
> -same treatment.  Patch 9.2 through 8.4; in 9.3 and later, pg_regress
> -gets pqsignal() via libpgport.
> -
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - src/interfaces/ecpg/test/Makefile |    4 ++--
> - src/test/isolation/Makefile       |   12 +++++++-----
> - 2 files changed, 9 insertions(+), 7 deletions(-)
> -
> -diff --git a/src/interfaces/ecpg/test/Makefile b/src/interfaces/ecpg/tes=
t/Makefile
> -index e9944c6..4bb9525 100644
> ---- a/src/interfaces/ecpg/test/Makefile
> -+++ b/src/interfaces/ecpg/test/Makefile
> -@@ -47,10 +47,10 @@ clean distclean maintainer-clean:
> -=20
> - all: pg_regress$(X)
> -=20
> --pg_regress$(X): pg_regress_ecpg.o $(top_builddir)/src/test/regress/pg_r=
egress.o
> -+pg_regress$(X): pg_regress_ecpg.o $(top_builddir)/src/test/regress/pg_r=
egress.o $(top_builddir)/src/test/regress/pqsignal.o
> - 	$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_EX) $^ $(LIBS) -o $@
> -=20
> --$(top_builddir)/src/test/regress/pg_regress.o:
> -+$(top_builddir)/src/test/regress/pg_regress.o $(top_builddir)/src/test/=
regress/pqsignal.o:
> - 	$(MAKE) -C $(dir $@) $(notdir $@)
> -=20
> - # dependencies ensure that path changes propagate
> -diff --git a/src/test/isolation/Makefile b/src/test/isolation/Makefile
> -index 46ea6f0..e20ba48 100644
> ---- a/src/test/isolation/Makefile
> -+++ b/src/test/isolation/Makefile
> -@@ -15,13 +15,15 @@ OBJS =3D  specparse.o isolationtester.o
> -=20
> - all: isolationtester$(X) pg_isolation_regress$(X)
> -=20
> --submake-regress:
> -+pg_regress.o:
> - 	$(MAKE) -C $(top_builddir)/src/test/regress pg_regress.o
> --
> --pg_regress.o: | submake-regress
> - 	rm -f $@ && $(LN_S) $(top_builddir)/src/test/regress/pg_regress.o .
> -=20
> --pg_isolation_regress$(X): isolation_main.o pg_regress.o
> -+pqsignal.o:
> -+	$(MAKE) -C $(top_builddir)/src/test/regress pqsignal.o
> -+	rm -f $@ && $(LN_S) $(top_builddir)/src/test/regress/pqsignal.o .
> -+
> -+pg_isolation_regress$(X): isolation_main.o pg_regress.o pqsignal.o
> - 	$(CC) $(CFLAGS) $^ $(LDFLAGS) $(LDFLAGS_EX) $(LIBS) -o $@
> -=20
> - isolationtester$(X): $(OBJS) | submake-libpq submake-libpgport
> -@@ -59,7 +61,7 @@ endif
> - # so do not clean them here
> - clean distclean:
> - 	rm -f isolationtester$(X) pg_isolation_regress$(X) $(OBJS) isolation_m=
ain.o
> --	rm -f pg_regress.o
> -+	rm -f pg_regress.o pqsignal.o
> - 	rm -rf $(pg_regress_clean_files)
> -=20
> - maintainer-clean: distclean
> ---=20
> -1.7.5.4
> -
> diff --git a/meta-oe/recipes-support/postgresql/files/0008-Prevent-potent=
ial-overruns-of-fixed-size-buffers.patch b/meta-oe/recipes-support/postgres=
ql/files/0008-Prevent-potential-overruns-of-fixed-size-buffers.patch
> deleted file mode 100644
> index 62ec935..0000000
> --- a/meta-oe/recipes-support/postgresql/files/0008-Prevent-potential-ove=
rruns-of-fixed-size-buffers.patch
> +++ /dev/null
> @@ -1,393 +0,0 @@
> -From 655b665f745e2e07cf6936c6063b0250f5caa98f Mon Sep 17 00:00:00 2001
> -From: Tom Lane <tgl@sss.pgh.pa.us>
> -Date: Mon, 17 Feb 2014 11:20:27 -0500
> -Subject: [PATCH] Prevent potential overruns of fixed-size buffers.
> -
> -commit 655b665f745e2e07cf6936c6063b0250f5caa98f REL9_2_STABLE
> -
> -Coverity identified a number of places in which it couldn't prove that a
> -string being copied into a fixed-size buffer would fit.  We believe that
> -most, perhaps all of these are in fact safe, or are copying data that is
> -coming from a trusted source so that any overrun is not really a security
> -issue.  Nonetheless it seems prudent to forestall any risk by using
> -strlcpy() and similar functions.
> -
> -Fixes by Peter Eisentraut and Jozef Mlich based on Coverity reports.
> -
> -In addition, fix a potential null-pointer-dereference crash in
> -contrib/chkpass.  The crypt(3) function is defined to return NULL on
> -failure, but chkpass.c didn't check for that before using the result.
> -The main practical case in which this could be an issue is if libc is
> -configured to refuse to execute unapproved hashing algorithms (e.g.,
> -"FIPS mode").  This ideally should've been a separate commit, but
> -since it touches code adjacent to one of the buffer overrun changes,
> -I included it in this commit to avoid last-minute merge issues.
> -This issue was reported by Honza Horak.
> -
> -Security: CVE-2014-0065 for buffer overruns, CVE-2014-0066 for crypt()
> -
> -Upsteam-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - contrib/chkpass/chkpass.c             |   29 ++++++++++++++++++++++++++=
---
> - contrib/pg_standby/pg_standby.c       |    2 +-
> - src/backend/access/transam/xlog.c     |   10 +++++-----
> - src/backend/tsearch/spell.c           |    2 +-
> - src/backend/utils/adt/datetime.c      |   11 ++++++-----
> - src/bin/initdb/findtimezone.c         |    4 ++--
> - src/bin/pg_basebackup/pg_basebackup.c |    8 ++++----
> - src/interfaces/ecpg/preproc/pgc.l     |    2 +-
> - src/interfaces/libpq/fe-protocol2.c   |    2 +-
> - src/interfaces/libpq/fe-protocol3.c   |    2 +-
> - src/port/exec.c                       |    4 ++--
> - src/test/regress/pg_regress.c         |    6 +++---
> - src/timezone/pgtz.c                   |    2 +-
> - 13 files changed, 54 insertions(+), 30 deletions(-)
> -
> -diff --git a/contrib/chkpass/chkpass.c b/contrib/chkpass/chkpass.c
> -index 0c9fec0..1795b8c 100644
> ---- a/contrib/chkpass/chkpass.c
> -+++ b/contrib/chkpass/chkpass.c
> -@@ -70,6 +70,7 @@ chkpass_in(PG_FUNCTION_ARGS)
> - 	char	   *str =3D PG_GETARG_CSTRING(0);
> - 	chkpass    *result;
> - 	char		mysalt[4];
> -+	char	   *crypt_output;
> - 	static char salt_chars[] =3D
> - 	"./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
> -=20
> -@@ -92,7 +93,15 @@ chkpass_in(PG_FUNCTION_ARGS)
> - 	mysalt[1] =3D salt_chars[random() & 0x3f];
> - 	mysalt[2] =3D 0;				/* technically the terminator is not necessary
> - 								 * but I like to play safe */
> --	strcpy(result->password, crypt(str, mysalt));
> -+
> -+	crypt_output =3D crypt(str, mysalt);
> -+	if (crypt_output =3D=3D NULL)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_INVALID_PARAMETER_VALUE),
> -+				 errmsg("crypt() failed")));
> -+
> -+	strlcpy(result->password, crypt_output, sizeof(result->password));
> -+
> - 	PG_RETURN_POINTER(result);
> - }
> -=20
> -@@ -141,9 +150,16 @@ chkpass_eq(PG_FUNCTION_ARGS)
> - 	chkpass    *a1 =3D (chkpass *) PG_GETARG_POINTER(0);
> - 	text	   *a2 =3D PG_GETARG_TEXT_PP(1);
> - 	char		str[9];
> -+	char	   *crypt_output;
> -=20
> - 	text_to_cstring_buffer(a2, str, sizeof(str));
> --	PG_RETURN_BOOL(strcmp(a1->password, crypt(str, a1->password)) =3D=3D 0=
);
> -+	crypt_output =3D crypt(str, a1->password);
> -+	if (crypt_output =3D=3D NULL)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_INVALID_PARAMETER_VALUE),
> -+				 errmsg("crypt() failed")));
> -+
> -+	PG_RETURN_BOOL(strcmp(a1->password, crypt_output) =3D=3D 0);
> - }
> -=20
> - PG_FUNCTION_INFO_V1(chkpass_ne);
> -@@ -153,7 +169,14 @@ chkpass_ne(PG_FUNCTION_ARGS)
> - 	chkpass    *a1 =3D (chkpass *) PG_GETARG_POINTER(0);
> - 	text	   *a2 =3D PG_GETARG_TEXT_PP(1);
> - 	char		str[9];
> -+	char	   *crypt_output;
> -=20
> - 	text_to_cstring_buffer(a2, str, sizeof(str));
> --	PG_RETURN_BOOL(strcmp(a1->password, crypt(str, a1->password)) !=3D 0);
> -+	crypt_output =3D crypt(str, a1->password);
> -+	if (crypt_output =3D=3D NULL)
> -+		ereport(ERROR,
> -+				(errcode(ERRCODE_INVALID_PARAMETER_VALUE),
> -+				 errmsg("crypt() failed")));
> -+
> -+	PG_RETURN_BOOL(strcmp(a1->password, crypt_output) !=3D 0);
> - }
> -diff --git a/contrib/pg_standby/pg_standby.c b/contrib/pg_standby/pg_sta=
ndby.c
> -index 84941ed..0f1e0c1 100644
> ---- a/contrib/pg_standby/pg_standby.c
> -+++ b/contrib/pg_standby/pg_standby.c
> -@@ -338,7 +338,7 @@ SetWALFileNameForCleanup(void)
> - 		if (strcmp(restartWALFileName, nextWALFileName) > 0)
> - 			return false;
> -=20
> --		strcpy(exclusiveCleanupFileName, restartWALFileName);
> -+		strlcpy(exclusiveCleanupFileName, restartWALFileName, sizeof(exclusiv=
eCleanupFileName));
> - 		return true;
> - 	}
> -=20
> -diff --git a/src/backend/access/transam/xlog.c b/src/backend/access/tran=
sam/xlog.c
> -index d639c4a..49bb453 100644
> ---- a/src/backend/access/transam/xlog.c
> -+++ b/src/backend/access/transam/xlog.c
> -@@ -3017,7 +3017,7 @@ KeepFileRestoredFromArchive(char *path, char *xlog=
fname)
> - 							xlogfpath, oldpath)));
> - 		}
> - #else
> --		strncpy(oldpath, xlogfpath, MAXPGPATH);
> -+		strlcpy(oldpath, xlogfpath, MAXPGPATH);
> - #endif
> - 		if (unlink(oldpath) !=3D 0)
> - 			ereport(FATAL,
> -@@ -5913,7 +5913,7 @@ recoveryStopsHere(XLogRecord *record, bool *includ=
eThis)
> -=20
> - 		recordRestorePointData =3D (xl_restore_point *) XLogRecGetData(record=
);
> - 		recordXtime =3D recordRestorePointData->rp_time;
> --		strncpy(recordRPName, recordRestorePointData->rp_name, MAXFNAMELEN);
> -+		strlcpy(recordRPName, recordRestorePointData->rp_name, MAXFNAMELEN);
> - 	}
> - 	else
> - 		return false;
> -@@ -6008,7 +6008,7 @@ recoveryStopsHere(XLogRecord *record, bool *includ=
eThis)
> - 		}
> - 		else
> - 		{
> --			strncpy(recoveryStopName, recordRPName, MAXFNAMELEN);
> -+			strlcpy(recoveryStopName, recordRPName, MAXFNAMELEN);
> -=20
> - 			ereport(LOG,
> - 				(errmsg("recovery stopping at restore point \"%s\", time %s",
> -@@ -6348,7 +6348,7 @@ StartupXLOG(void)
> - 	 * see them
> - 	 */
> - 	XLogCtl->RecoveryTargetTLI =3D recoveryTargetTLI;
> --	strncpy(XLogCtl->archiveCleanupCommand,
> -+	strlcpy(XLogCtl->archiveCleanupCommand,
> - 			archiveCleanupCommand ? archiveCleanupCommand : "",
> - 			sizeof(XLogCtl->archiveCleanupCommand));
> -=20
> -@@ -8760,7 +8760,7 @@ XLogRestorePoint(const char *rpName)
> - 	xl_restore_point xlrec;
> -=20
> - 	xlrec.rp_time =3D GetCurrentTimestamp();
> --	strncpy(xlrec.rp_name, rpName, MAXFNAMELEN);
> -+	strlcpy(xlrec.rp_name, rpName, MAXFNAMELEN);
> -=20
> - 	rdata.buffer =3D InvalidBuffer;
> - 	rdata.data =3D (char *) &xlrec;
> -diff --git a/src/backend/tsearch/spell.c b/src/backend/tsearch/spell.c
> -index 449aa6a..4acc33e 100644
> ---- a/src/backend/tsearch/spell.c
> -+++ b/src/backend/tsearch/spell.c
> -@@ -255,7 +255,7 @@ NIAddSpell(IspellDict *Conf, const char *word, const=
 char *flag)
> - 	}
> - 	Conf->Spell[Conf->nspell] =3D (SPELL *) tmpalloc(SPELLHDRSZ + strlen(w=
ord) + 1);
> - 	strcpy(Conf->Spell[Conf->nspell]->word, word);
> --	strncpy(Conf->Spell[Conf->nspell]->p.flag, flag, MAXFLAGLEN);
> -+	strlcpy(Conf->Spell[Conf->nspell]->p.flag, flag, MAXFLAGLEN);
> - 	Conf->nspell++;
> - }
> -=20
> -diff --git a/src/backend/utils/adt/datetime.c b/src/backend/utils/adt/da=
tetime.c
> -index 4763a6f..4105f17 100644
> ---- a/src/backend/utils/adt/datetime.c
> -+++ b/src/backend/utils/adt/datetime.c
> -@@ -90,10 +90,10 @@ char	   *days[] =3D {"Sunday", "Monday", "Tuesday", =
"Wednesday",
> -  * Note that this table must be strictly alphabetically ordered to allo=
w an
> -  * O(ln(N)) search algorithm to be used.
> -  *
> -- * The text field is NOT guaranteed to be NULL-terminated.
> -+ * The token field is NOT guaranteed to be NULL-terminated.
> -  *
> -- * To keep this table reasonably small, we divide the lexval for TZ and=
 DTZ
> -- * entries by 15 (so they are on 15 minute boundaries) and truncate the=
 text
> -+ * To keep this table reasonably small, we divide the value for TZ and =
DTZ
> -+ * entries by 15 (so they are on 15 minute boundaries) and truncate the=
 token
> -  * field at TOKMAXLEN characters.
> -  * Formerly, we divided by 10 rather than 15 but there are a few time z=
ones
> -  * which are 30 or 45 minutes away from an even hour, most are on an ho=
ur
> -@@ -108,7 +108,7 @@ static datetkn *timezonetktbl =3D NULL;
> - static int	sztimezonetktbl =3D 0;
> -=20
> - static const datetkn datetktbl[] =3D {
> --/*	text, token, lexval */
> -+	/* token, type, value */
> - 	{EARLY, RESERV, DTK_EARLY}, /* "-infinity" reserved for "early time" */
> - 	{DA_D, ADBC, AD},			/* "ad" for years > 0 */
> - 	{"allballs", RESERV, DTK_ZULU},		/* 00:00:00 */
> -@@ -188,7 +188,7 @@ static const datetkn datetktbl[] =3D {
> - static int	szdatetktbl =3D sizeof datetktbl / sizeof datetktbl[0];
> -=20
> - static datetkn deltatktbl[] =3D {
> --	/* text, token, lexval */
> -+	/* token, type, value */
> - 	{"@", IGNORE_DTF, 0},		/* postgres relative prefix */
> - 	{DAGO, AGO, 0},				/* "ago" indicates negative time offset */
> - 	{"c", UNITS, DTK_CENTURY},	/* "century" relative */
> -@@ -4201,6 +4201,7 @@ ConvertTimeZoneAbbrevs(TimeZoneAbbrevTable *tbl,
> - 	tbl->numabbrevs =3D n;
> - 	for (i =3D 0; i < n; i++)
> - 	{
> -+		/* do NOT use strlcpy here; token field need not be null-terminated */
> - 		strncpy(newtbl[i].token, abbrevs[i].abbrev, TOKMAXLEN);
> - 		newtbl[i].type =3D abbrevs[i].is_dst ? DTZ : TZ;
> - 		TOVAL(&newtbl[i], abbrevs[i].offset / MINS_PER_HOUR);
> -diff --git a/src/bin/initdb/findtimezone.c b/src/bin/initdb/findtimezone=
=2Ec
> -index 6d6f96a..6d38151 100644
> ---- a/src/bin/initdb/findtimezone.c
> -+++ b/src/bin/initdb/findtimezone.c
> -@@ -68,7 +68,7 @@ pg_open_tzfile(const char *name, char *canonname)
> - 	if (canonname)
> - 		strlcpy(canonname, name, TZ_STRLEN_MAX + 1);
> -=20
> --	strcpy(fullname, pg_TZDIR());
> -+	strlcpy(fullname, pg_TZDIR(), sizeof(fullname));
> - 	if (strlen(fullname) + 1 + strlen(name) >=3D MAXPGPATH)
> - 		return -1;				/* not gonna fit */
> - 	strcat(fullname, "/");
> -@@ -375,7 +375,7 @@ identify_system_timezone(void)
> - 	}
> -=20
> - 	/* Search for the best-matching timezone file */
> --	strcpy(tmptzdir, pg_TZDIR());
> -+	strlcpy(tmptzdir, pg_TZDIR(), sizeof(tmptzdir));
> - 	bestscore =3D -1;
> - 	resultbuf[0] =3D '\0';
> - 	scan_available_timezones(tmptzdir, tmptzdir + strlen(tmptzdir) + 1,
> -diff --git a/src/bin/pg_basebackup/pg_basebackup.c b/src/bin/pg_baseback=
up/pg_basebackup.c
> -index 9d840a1..26cc758 100644
> ---- a/src/bin/pg_basebackup/pg_basebackup.c
> -+++ b/src/bin/pg_basebackup/pg_basebackup.c
> -@@ -735,9 +735,9 @@ ReceiveAndUnpackTarFile(PGconn *conn, PGresult *res,=
 int rownum)
> - 	FILE	   *file =3D NULL;
> -=20
> - 	if (PQgetisnull(res, rownum, 0))
> --		strcpy(current_path, basedir);
> -+		strlcpy(current_path, basedir, sizeof(current_path));
> - 	else
> --		strcpy(current_path, PQgetvalue(res, rownum, 1));
> -+		strlcpy(current_path, PQgetvalue(res, rownum, 1), sizeof(current_path=
));
> -=20
> - 	/*
> - 	 * Get the COPY data
> -@@ -1053,7 +1053,7 @@ BaseBackup(void)
> - 				progname);
> - 		disconnect_and_exit(1);
> - 	}
> --	strcpy(xlogstart, PQgetvalue(res, 0, 0));
> -+	strlcpy(xlogstart, PQgetvalue(res, 0, 0), sizeof(xlogstart));
> - 	if (verbose && includewal)
> - 		fprintf(stderr, "transaction log start point: %s\n", xlogstart);
> - 	PQclear(res);
> -@@ -1153,7 +1153,7 @@ BaseBackup(void)
> - 				progname);
> - 		disconnect_and_exit(1);
> - 	}
> --	strcpy(xlogend, PQgetvalue(res, 0, 0));
> -+	strlcpy(xlogend, PQgetvalue(res, 0, 0), sizeof(xlogend));
> - 	if (verbose && includewal)
> - 		fprintf(stderr, "transaction log end point: %s\n", xlogend);
> - 	PQclear(res);
> -diff --git a/src/interfaces/ecpg/preproc/pgc.l b/src/interfaces/ecpg/pre=
proc/pgc.l
> -index f2e7edd..7ae8556 100644
> ---- a/src/interfaces/ecpg/preproc/pgc.l
> -+++ b/src/interfaces/ecpg/preproc/pgc.l
> -@@ -1315,7 +1315,7 @@ parse_include(void)
> - 		yytext[i] =3D '\0';
> - 		memmove(yytext, yytext+1, strlen(yytext));
> -=20
> --		strncpy(inc_file, yytext, sizeof(inc_file));
> -+		strlcpy(inc_file, yytext, sizeof(inc_file));
> - 		yyin =3D fopen(inc_file, "r");
> - 		if (!yyin)
> - 		{
> -diff --git a/src/interfaces/libpq/fe-protocol2.c b/src/interfaces/libpq/=
fe-protocol2.c
> -index 1ba5885..af4c412 100644
> ---- a/src/interfaces/libpq/fe-protocol2.c
> -+++ b/src/interfaces/libpq/fe-protocol2.c
> -@@ -500,7 +500,7 @@ pqParseInput2(PGconn *conn)
> - 						if (!conn->result)
> - 							return;
> - 					}
> --					strncpy(conn->result->cmdStatus, conn->workBuffer.data,
> -+					strlcpy(conn->result->cmdStatus, conn->workBuffer.data,
> - 							CMDSTATUS_LEN);
> - 					checkXactStatus(conn, conn->workBuffer.data);
> - 					conn->asyncStatus =3D PGASYNC_READY;
> -diff --git a/src/interfaces/libpq/fe-protocol3.c b/src/interfaces/libpq/=
fe-protocol3.c
> -index d289f82..6f8a470 100644
> ---- a/src/interfaces/libpq/fe-protocol3.c
> -+++ b/src/interfaces/libpq/fe-protocol3.c
> -@@ -206,7 +206,7 @@ pqParseInput3(PGconn *conn)
> - 						if (!conn->result)
> - 							return;
> - 					}
> --					strncpy(conn->result->cmdStatus, conn->workBuffer.data,
> -+					strlcpy(conn->result->cmdStatus, conn->workBuffer.data,
> - 							CMDSTATUS_LEN);
> - 					conn->asyncStatus =3D PGASYNC_READY;
> - 					break;
> -diff --git a/src/port/exec.c b/src/port/exec.c
> -index c79e8ba..0726dbe 100644
> ---- a/src/port/exec.c
> -+++ b/src/port/exec.c
> -@@ -66,7 +66,7 @@ validate_exec(const char *path)
> - 	if (strlen(path) >=3D strlen(".exe") &&
> - 		pg_strcasecmp(path + strlen(path) - strlen(".exe"), ".exe") !=3D 0)
> - 	{
> --		strcpy(path_exe, path);
> -+		strlcpy(path_exe, path, sizeof(path_exe) - 4);
> - 		strcat(path_exe, ".exe");
> - 		path =3D path_exe;
> - 	}
> -@@ -275,7 +275,7 @@ resolve_symlinks(char *path)
> - 	}
> -=20
> - 	/* must copy final component out of 'path' temporarily */
> --	strcpy(link_buf, fname);
> -+	strlcpy(link_buf, fname, sizeof(link_buf));
> -=20
> - 	if (!getcwd(path, MAXPGPATH))
> - 	{
> -diff --git a/src/test/regress/pg_regress.c b/src/test/regress/pg_regress=
=2Ec
> -index d991a5c..a6466eb 100644
> ---- a/src/test/regress/pg_regress.c
> -+++ b/src/test/regress/pg_regress.c
> -@@ -1233,7 +1233,7 @@ results_differ(const char *testname, const char *r=
esultsfile, const char *defaul
> - 	 */
> - 	platform_expectfile =3D get_expectfile(testname, resultsfile);
> -=20
> --	strcpy(expectfile, default_expectfile);
> -+	strlcpy(expectfile, default_expectfile, sizeof(expectfile));
> - 	if (platform_expectfile)
> - 	{
> - 		/*
> -@@ -1288,7 +1288,7 @@ results_differ(const char *testname, const char *r=
esultsfile, const char *defaul
> - 		{
> - 			/* This diff was a better match than the last one */
> - 			best_line_count =3D l;
> --			strcpy(best_expect_file, alt_expectfile);
> -+			strlcpy(best_expect_file, alt_expectfile, sizeof(best_expect_file));
> - 		}
> - 		free(alt_expectfile);
> - 	}
> -@@ -1316,7 +1316,7 @@ results_differ(const char *testname, const char *r=
esultsfile, const char *defaul
> - 		{
> - 			/* This diff was a better match than the last one */
> - 			best_line_count =3D l;
> --			strcpy(best_expect_file, default_expectfile);
> -+			strlcpy(best_expect_file, default_expectfile, sizeof(best_expect_fil=
e));
> - 		}
> - 	}
> -=20
> -diff --git a/src/timezone/pgtz.c b/src/timezone/pgtz.c
> -index d5bc83e..80c5635 100644
> ---- a/src/timezone/pgtz.c
> -+++ b/src/timezone/pgtz.c
> -@@ -83,7 +83,7 @@ pg_open_tzfile(const char *name, char *canonname)
> - 	 * Loop to split the given name into directory levels; for each level,
> - 	 * search using scan_directory_ci().
> - 	 */
> --	strcpy(fullname, pg_TZDIR());
> -+	strlcpy(fullname, pg_TZDIR(), sizeof(fullname));
> - 	orignamelen =3D fullnamelen =3D strlen(fullname);
> - 	fname =3D name;
> - 	for (;;)
> ---=20
> -1.7.5.4
> -
> diff --git a/meta-oe/recipes-support/postgresql/postgresql-9.2.4/ecpg-par=
allel-make-fix.patch b/meta-oe/recipes-support/postgresql/postgresql-9.4.2/=
ecpg-parallel-make-fix.patch
> similarity index 100%
> rename from meta-oe/recipes-support/postgresql/postgresql-9.2.4/ecpg-para=
llel-make-fix.patch
> rename to meta-oe/recipes-support/postgresql/postgresql-9.4.2/ecpg-parall=
el-make-fix.patch
> diff --git a/meta-oe/recipes-support/postgresql/postgresql-9.2.4/remove.a=
utoconf.version.check.patch b/meta-oe/recipes-support/postgresql/postgresql=
-9.4.2/remove.autoconf.version.check.patch
> similarity index 71%
> rename from meta-oe/recipes-support/postgresql/postgresql-9.2.4/remove.au=
toconf.version.check.patch
> rename to meta-oe/recipes-support/postgresql/postgresql-9.4.2/remove.auto=
conf.version.check.patch
> index 022aa3d..be23fd4 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql-9.2.4/remove.autoconf=
=2Eversion.check.patch
> +++ b/meta-oe/recipes-support/postgresql/postgresql-9.4.2/remove.autoconf=
=2Eversion.check.patch
> @@ -4,12 +4,13 @@ Index: postgresql-9.2.4/configure.in
>  +++ postgresql-9.2.4/configure.in
>  @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
>  =20
> - AC_INIT([PostgreSQL], [9.2.4], [pgsql-bugs@postgresql.org])
> + AC_INIT([PostgreSQL], [9.4.2], [pgsql-bugs@postgresql.org])
>  =20
> --m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.63], [], [m4_fatal([Autoconf ve=
rsion 2.63 is required.
> +-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf ve=
rsion 2.69 is required.
>  -Untested combinations of 'autoconf' and PostgreSQL versions are not
>  -recommended.  You can remove the check from 'configure.in' but it is th=
en
>  -your responsibility whether the result works or not.])])
> - AC_COPYRIGHT([Copyright (c) 1996-2012, PostgreSQL Global Development Gr=
oup])
> + AC_COPYRIGHT([Copyright (c) 1996-2014, PostgreSQL Global Development Gr=
oup])
>   AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
>   AC_CONFIG_AUX_DIR(config)
> +
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/=
recipes-support/postgresql/postgresql.inc
> index 1397f56..c7aed9e 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -31,13 +31,6 @@ SRC_URI =3D "http://ftp.postgresql.org/pub/source/v${P=
V}/${BP}.tar.bz2 \
>             file://postgresql-setup \
>             file://postgresql.service \
>             file://0001-Use-pkg-config-for-libxml2-detection.patch \
> -           file://0002-Predict-integer-overflow-to-avoid-buffer-overruns=
=2Epatch \
> -           file://0003-Shore-up-ADMIN-OPTION-restrictions.patch \
> -           file://0004-Prevent-privilege-escalation-in-explicit-calls-to=
-PL.patch \
> -           file://0005-Avoid-repeated-name-lookups-during-table-and-inde=
x-D.patch \
> -           file://0006-Fix-handling-of-wide-datetime-input-output.patch \
> -           file://0007-Make-pqsignal-available-to-pg_regress-of-ECPG-and=
-is.patch \
> -           file://0008-Prevent-potential-overruns-of-fixed-size-buffers.=
patch \
>            "
> =20
>  LEAD_SONAME =3D "libpq.so"
> @@ -76,7 +69,6 @@ PACKAGECONFIG[perl] =3D "--with-perl,--without-perl,per=
l,perl"
>  EXTRA_OECONF +=3D "--enable-thread-safety --disable-rpath \
>                   --datadir=3D${datadir}/${BPN} \
>                   --sysconfdir=3D${sysconfdir}/${BPN} \
> -                 --without-krb5 \
>  "
>  EXTRA_OECONF_sh4 +=3D "--disable-spinlocks"
>  EXTRA_OECONF_aarch64 +=3D "--disable-spinlocks"
> diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb b/met=
a-oe/recipes-support/postgresql/postgresql_9.2.4.bb
> deleted file mode 100644
> index 49ca53f..0000000
> --- a/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require postgresql.inc
> -
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dab55a5887d3f8ba77d0fd7db787=
e4bab"
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "\
> -    file://remove.autoconf.version.check.patch \
> -    file://ecpg-parallel-make-fix.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "6ee5bb53b97da7c6ad9cb0825d3300dd"
> -SRC_URI[sha256sum] =3D "d97dd918a88a4449225998f46aafa85216a3f89163a34118=
30d6890507ffae93"
> diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.2.bb b/met=
a-oe/recipes-support/postgresql/postgresql_9.4.2.bb
> new file mode 100644
> index 0000000..6a5bca4
> --- /dev/null
> +++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.2.bb
> @@ -0,0 +1,12 @@
> +require postgresql.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D7d847a9b446ddfe187acfac6641=
89672"
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "\
> +    file://remove.autoconf.version.check.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "b6369156607a4fd88f21af6fec0f30b9"
> +SRC_URI[sha256sum] =3D "81fda191c165ba1d25d75cd0166ece5abdcb4a7f5eca01b3=
49371e279ebb4d11"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

